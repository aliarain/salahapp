<?php

namespace App\Http\Controllers;

use App\Models\PrayerTime;
use App\Models\Masjid;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Storage;

class PrayerTimeController extends Controller
{
    /**
     * Display a listing of prayer times.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $query = PrayerTime::query();

        if ($request->has('masjid_id')) {
            $query->where('masjid_id', $request->input('masjid_id'));
        }

        if ($request->has('date')) {
            $query->whereDate('date', $request->input('date'));
        } else if ($request->has('start_date') && $request->has('end_date')) {
            $query->whereBetween('date', [
                $request->input('start_date'),
                $request->input('end_date')
            ]);
        }

        $prayerTimes = $query->with('masjid')->get();
        return response()->json(['data' => $prayerTimes]);
    }

    /**
     * Store a newly created prayer time in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'masjid_id' => 'required|exists:masjids,id',
            'date' => 'required|date',
            'prayer_data' => 'required|array',
            'source' => 'nullable|string',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $prayerTime = PrayerTime::create($request->all());
        return response()->json(['data' => $prayerTime], 201);
    }

    /**
     * Display the specified prayer time.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $prayerTime = PrayerTime::with('masjid')->findOrFail($id);
        return response()->json(['data' => $prayerTime]);
    }

    /**
     * Update the specified prayer time in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $prayerTime = PrayerTime::findOrFail($id);

        $validator = Validator::make($request->all(), [
            'masjid_id' => 'sometimes|required|exists:masjids,id',
            'date' => 'sometimes|required|date',
            'prayer_data' => 'sometimes|required|array',
            'source' => 'nullable|string',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $prayerTime->update($request->all());
        return response()->json(['data' => $prayerTime]);
    }

    /**
     * Remove the specified prayer time from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $prayerTime = PrayerTime::findOrFail($id);
        $prayerTime->delete();
        return response()->json(['message' => 'Prayer time deleted successfully']);
    }

    /**
     * Get prayer times for a specific masjid.
     *
     * @param  int  $masjidId
     * @return \Illuminate\Http\Response
     */
    public function getByMasjid($masjidId)
    {
        try {
            $masjid = Masjid::findOrFail($masjidId);

            // Get prayer times for the next 7 days by default
            $startDate = request('start_date', date('Y-m-d'));
            $endDate = request('end_date', date('Y-m-d', strtotime('+7 days')));

            $prayerTimes = PrayerTime::where('masjid_id', $masjidId)
                ->whereBetween('date', [$startDate, $endDate])
                ->orderBy('date')
                ->get();

            return response()->json([
                'status' => 'success',
                'data' => [
                    'masjid' => $masjid,
                    'prayer_times' => $prayerTimes
                ]
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'error',
                'message' => 'Failed to get prayer times',
                'error' => $e->getMessage()
            ], $e instanceof \Illuminate\Database\Eloquent\ModelNotFoundException ? 404 : 500);
        }
    }

    /**
     * Scan timetable image and extract prayer times using AI.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function scanTimetable(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'image' => 'required|image|max:5120', // Max 5MB
            'masjid_id' => 'required|exists:masjids,id',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 'error',
                'message' => 'Validation failed',
                'errors' => $validator->errors()
            ], 422);
        }

        try {
            // Store the image
            $imagePath = $request->file('image')->store('timetable_scans', 'public');

            // Get image as base64
            $imageData = base64_encode(file_get_contents($request->file('image')->path()));

            // System prompt for Deepseek
            $systemPrompt = "Please extract the prayer timetable from this image with high precision. Format the data as a JSON object with the following structure:

{
  \"timetable\": [
    {
      \"date\": \"YYYY-MM-DD\",
      \"fajr_beginning\": \"H:MM AM/PM\",
      \"fajr_jamaat\": \"H:MM AM/PM\",
      \"sunrise\": \"H:MM AM/PM\",
      \"zohar_beginning\": \"H:MM AM/PM\",
      \"zohar_jamaat\": \"H:MM AM/PM\",
      \"asr_beginning\": \"H:MM AM/PM\",
      \"asr_jamaat\": \"H:MM AM/PM\",
      \"maghrib\": \"H:MM AM/PM\",
      \"isha_beginning\": \"H:MM AM/PM\",
      \"isha_jamaat\": \"H:MM AM/PM\",
      \"sehri\": \"H:MM AM/PM\",
      \"iftari\": \"H:MM AM/PM\"
    }
  ]
}

Follow these formatting rules:
1. Time format: Use H:MM AM/PM format (e.g., 5:08 AM, 12:27 PM)
2. Date format: Use YYYY-MM-DD format (e.g., 2025-03-01)
3. Replace ditto marks (\"\", ''', etc.) with the actual value they refer to
4. If a field doesn't exist in the image, use null instead of an empty string
5. Preserve multiple times exactly as shown (e.g., \"12:40 & 1:20\")
6. Include all days shown in the timetable

Return ONLY the JSON object, no additional text or explanations.";

            // Call Deepseek API
            $response = Http::withHeaders([
                'Authorization' => 'Bearer ' . env('DEEPSEEK_API_KEY'),
                'Content-Type' => 'application/json',
            ])->post('https://api.deepseek.com/v1/chat/completions', [
                'model' => 'deepseek-vision',
                'messages' => [
                    [
                        'role' => 'system',
                        'content' => $systemPrompt
                    ],
                    [
                        'role' => 'user',
                        'content' => [
                            [
                                'type' => 'image_url',
                                'image_url' => [
                                    'url' => 'data:image/jpeg;base64,' . $imageData
                                ]
                            ]
                        ]
                    ]
                ],
                'max_tokens' => 4000
            ]);

            if ($response->failed()) {
                return response()->json([
                    'status' => 'error',
                    'message' => 'Failed to process image with AI',
                    'error' => $response->body()
                ], 500);
            }

            $aiResponse = $response->json();
            $extractedText = $aiResponse['choices'][0]['message']['content'];

            // Parse the JSON from the response
            try {
                $prayerTimesData = json_decode($extractedText, true);

                if (!isset($prayerTimesData['timetable']) || !is_array($prayerTimesData['timetable'])) {
                    throw new \Exception('Invalid data format returned from AI');
                }

                // Get the masjid
                $masjid = Masjid::findOrFail($request->masjid_id);

                // Save each day's prayer times
                $savedPrayerTimes = [];
                foreach ($prayerTimesData['timetable'] as $dayData) {
                    // Skip if date is not valid
                    if (!isset($dayData['date']) || !strtotime($dayData['date'])) {
                        continue;
                    }

                    // Prepare prayer data
                    $prayerData = [
                        'fajr' => [
                            'beginning' => $dayData['fajr_beginning'] ?? null,
                            'jamaat' => $dayData['fajr_jamaat'] ?? null
                        ],
                        'sunrise' => $dayData['sunrise'] ?? null,
                        'dhuhr' => [
                            'beginning' => $dayData['zohar_beginning'] ?? null,
                            'jamaat' => $dayData['zohar_jamaat'] ?? null
                        ],
                        'asr' => [
                            'beginning' => $dayData['asr_beginning'] ?? null,
                            'jamaat' => $dayData['asr_jamaat'] ?? null
                        ],
                        'maghrib' => $dayData['maghrib'] ?? null,
                        'isha' => [
                            'beginning' => $dayData['isha_beginning'] ?? null,
                            'jamaat' => $dayData['isha_jamaat'] ?? null
                        ],
                        'sehri' => $dayData['sehri'] ?? null,
                        'iftari' => $dayData['iftari'] ?? null
                    ];

                    // Check if prayer time already exists
                    $existingPrayerTime = PrayerTime::where('masjid_id', $request->masjid_id)
                        ->where('date', $dayData['date'])
                        ->first();

                    if ($existingPrayerTime) {
                        $existingPrayerTime->prayer_data = json_encode($prayerData);
                        $existingPrayerTime->source = 'scan';
                        $existingPrayerTime->timetable_image = $imagePath;
                        $existingPrayerTime->save();
                        $savedPrayerTimes[] = $existingPrayerTime;
                    } else {
                        $prayerTime = PrayerTime::create([
                            'masjid_id' => $request->masjid_id,
                            'date' => $dayData['date'],
                            'prayer_data' => json_encode($prayerData),
                            'source' => 'scan',
                            'timetable_image' => $imagePath,
                        ]);
                        $savedPrayerTimes[] = $prayerTime;
                    }
                }

                return response()->json([
                    'status' => 'success',
                    'message' => count($savedPrayerTimes) . ' days of prayer times extracted and saved',
                    'data' => [
                        'masjid' => $masjid,
                        'prayer_times' => $savedPrayerTimes,
                        'image_url' => url('storage/' . $imagePath),
                        'extracted_data' => $prayerTimesData
                    ]
                ]);
            } catch (\Exception $e) {
                return response()->json([
                    'status' => 'error',
                    'message' => 'Failed to process AI response',
                    'error' => $e->getMessage(),
                    'ai_response' => $extractedText
                ], 422);
            }
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'error',
                'message' => 'Failed to scan timetable',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    public function processTimetable(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'masjid_id' => 'required|exists:masjids,id',
            'image' => 'required|image|max:5120', // Max 5MB
            'extracted_data' => 'required|json',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        // Store the image
        $path = $request->file('image')->store('timetables', 'public');

        // Process the extracted data
        $extractedData = json_decode($request->input('extracted_data'), true);

        // Create prayer times from the extracted data
        $prayerTimes = [];

        // Handle different possible formats from the AI
        if (isset($extractedData['date'])) {
            // Single date format
            $prayerTime = PrayerTime::create([
                'masjid_id' => $request->input('masjid_id'),
                'date' => $extractedData['date'],
                'prayer_data' => array_diff_key($extractedData, ['date' => '']),
                'source' => 'scan',
                'timetable_image' => $path,
            ]);
            $prayerTimes[] = $prayerTime;
        } elseif (isset($extractedData['dates']) && is_array($extractedData['dates'])) {
            // Multiple dates format
            foreach ($extractedData['dates'] as $date => $times) {
                $prayerTime = PrayerTime::create([
                    'masjid_id' => $request->input('masjid_id'),
                    'date' => $date,
                    'prayer_data' => $times,
                    'source' => 'scan',
                    'timetable_image' => $path,
                ]);
                $prayerTimes[] = $prayerTime;
            }
        } else {
            // Assume it's a single day with no date specified (use current date)
            $prayerTime = PrayerTime::create([
                'masjid_id' => $request->input('masjid_id'),
                'date' => now()->format('Y-m-d'),
                'prayer_data' => $extractedData,
                'source' => 'scan',
                'timetable_image' => $path,
            ]);
            $prayerTimes[] = $prayerTime;
        }

        return response()->json([
            'success' => true,
            'data' => $prayerTimes,
            'image_url' => Storage::url($path),
        ]);
    }

    public function getMasjidPrayerTimes($masjidId, Request $request)
    {
        $masjid = Masjid::findOrFail($masjidId);

        $query = $masjid->prayerTimes();

        if ($request->has('date')) {
            $query->whereDate('date', $request->input('date'));
        } else if ($request->has('start_date') && $request->has('end_date')) {
            $query->whereBetween('date', [
                $request->input('start_date'),
                $request->input('end_date')
            ]);
        }

        $prayerTimes = $query->get();
        return response()->json(['data' => $prayerTimes]);
    }
}