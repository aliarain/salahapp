<?php namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Masjid;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;

class MasjidController extends Controller
{
    /**
     * Display a listing of all masjids.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        try {
            $masjids = Masjid::all();

            // Sanitize the data to ensure proper UTF-8 encoding
            $masjids = $masjids->map(function ($masjid) {
                // Process string attributes to ensure proper UTF-8
                foreach ($masjid->getAttributes() as $key => $value) {
                    if (is_string($value)) {
                        $masjid->{$key} = mb_convert_encoding($value, 'UTF-8', 'UTF-8');
                    }
                }

                // Handle JSON fields separately
                if (isset($masjid->contact_info) && is_array($masjid->contact_info)) {
                    $masjid->contact_info = json_decode(json_encode($masjid->contact_info), true);
                }

                return $masjid;
            });

            return response()->json(['data' => $masjids], 200, [
                'Content-Type' => 'application/json; charset=UTF-8'
            ]);
        } catch (\Exception $e) {
            \Log::error('Error fetching masjids: ' . $e->getMessage());
            return response()->json([
                'message' => 'Error fetching masjids',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Store a newly created masjid in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    // In MasjidController.php, update the store method:
    public function store(Request $request)
{
    $validator = Validator::make($request->all(), [
        'name' => 'required|string|max:255',
        'address' => 'required|string',
        'latitude' => 'required|numeric',
        'longitude' => 'required|numeric',
        'contact_info' => 'nullable',  // Make it optional
        'timezone' => 'nullable|string',
        'calculation_method' => 'nullable|numeric',  // Make it optional
        'asr_method' => 'nullable|numeric',         // Make it optional
    ]);

    if ($validator->fails()) {
        return response()->json(['errors' => $validator->errors()], 422);
    }

    try {
        $masjidData = $request->all();

        // Set default values if not provided
        if (!isset($masjidData['calculation_method'])) {
            $masjidData['calculation_method'] = 1; // Default calculation method
        }

        if (!isset($masjidData['asr_method'])) {
            $masjidData['asr_method'] = 1; // Default asr method
        }

        // Handle contact_info if provided
        if (isset($masjidData['contact_info'])) {
            if (is_string($masjidData['contact_info'])) {
                $decodedContact = json_decode($masjidData['contact_info'], true);
                if (json_last_error() === JSON_ERROR_NONE) {
                    $masjidData['contact_info'] = $decodedContact;
                } else {
                    $masjidData['contact_info'] = ['info' => $masjidData['contact_info']];
                }
            } elseif (!is_array($masjidData['contact_info'])) {
                $masjidData['contact_info'] = ['info' => (string)$masjidData['contact_info']];
            }
        } else {
            $masjidData['contact_info'] = []; // Empty array if not provided
        }

        $masjid = Masjid::create($masjidData);

        return response()->json([
            'message' => 'Masjid created successfully',
            'data' => $masjid
        ], 201);

    } catch (\Exception $e) {
        \Log::error('Failed to create masjid: ' . $e->getMessage());
        return response()->json([
            'message' => 'Failed to create masjid',
            'error' => $e->getMessage()
        ], 500);
    }
}

// public function store(Request $request)
// {
//     $validator = Validator::make($request->all(), [
//         'name' => 'required|string|max:255',
//         'address' => 'required|string',
//         'latitude' => 'required|numeric',
//         'longitude' => 'required|numeric',
//         'contact_info' => 'required',  // Accept any format initially
//         'timezone' => 'nullable|string',
//         'calculation_method' => 'nullable|numeric',
//         'asr_method' => 'nullable|numeric',
//     ]);

//     if ($validator->fails()) {
//         return response()->json(['errors' => $validator->errors()], 422);
//     }

//     try {
//         $masjidData = $request->all();

//         // Handle contact_info formatting
//         if (is_string($masjidData['contact_info'])) {
//             // If it's a JSON string, decode it
//             $decodedContact = json_decode($masjidData['contact_info'], true);
//             if (json_last_error() === JSON_ERROR_NONE) {
//                 $masjidData['contact_info'] = $decodedContact;
//             } else {
//                 // If it's not valid JSON, create an array with the string
//                 $masjidData['contact_info'] = ['info' => $masjidData['contact_info']];
//             }
//         } elseif (!is_array($masjidData['contact_info'])) {
//             // If it's neither string nor array, convert to array
//             $masjidData['contact_info'] = ['info' => (string)$masjidData['contact_info']];
//         }

//         // Ensure calculation_method and asr_method are integers
//         // $masjidData['calculation_method'] = (int)$masjidData['calculation_method'];
//         // $masjidData['asr_method'] = (int)$masjidData['asr_method'];

//         $masjid = Masjid::create($masjidData);

//         return response()->json([
//             'message' => 'Masjid created successfully',
//             'data' => $masjid
//         ], 201);

//     } catch (\Exception $e) {
//         \Log::error('Failed to create masjid: ' . $e->getMessage());
//         return response()->json([
//             'message' => 'Failed to create masjid',
//             'error' => $e->getMessage()
//         ], 500);
//     }
// }
    // public function store(Request $request)
    // {
    //     $validator = Validator::make($request->all(), [
    //         'name' => 'required|string|max:255',
    //         'address' => 'required|string',
    //         'latitude' => 'nullable|numeric',
    //         'longitude' => 'nullable|numeric',
    //         'contact_info' => 'required',
    //         'timezone' => 'nullable|string',
    //         'calculation_method' => 'nullable|string',
    //         'asr_method' => 'nullable|string',
    //     ]);

    //     if ($validator->fails()) {
    //         return response()->json(['errors' => $validator->errors()], 422);


    //     }

    // // Ensure contact_info is properly formatted before saving
    // $masjidData = $request->all();

    // // If contact_info is null or not provided, set it to an empty object
    // if (!isset($masjidData['contact_info'])) {
    //     $masjidData['contact_info'] = [];
    // }

    //     $masjid = Masjid::create($request->all());
    //     return response()->json(['data' => $masjid], 201);
    // }

    /**
     * Display the specified masjid.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $masjid = Masjid::findOrFail($id);
        return response()->json(['data' => $masjid]);
    }

    /**
     * Update the specified masjid in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $masjid = Masjid::findOrFail($id);

        $validator = Validator::make($request->all(), [
            'name' => 'sometimes|required|string|max:255',
            'address' => 'sometimes|required|string',
            'latitude' => 'nullable|numeric',
            'longitude' => 'nullable|numeric',
            'contact_info' => 'nullable|array',
            'timezone' => 'nullable|string',
            'calculation_method' => 'nullable|integer',
            'asr_method' => 'nullable|integer',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        try {
            $updateData = $request->all();

            // Handle contact_info properly for updates
            if (isset($updateData['contact_info']) && is_string($updateData['contact_info'])) {
                try {
                    $decodedContactInfo = json_decode($updateData['contact_info'], true);
                    if (json_last_error() === JSON_ERROR_NONE) {
                        $updateData['contact_info'] = $decodedContactInfo;
                    }
                } catch (\Exception $e) {
                    // Keep as is if it can't be decoded
                }
            }

            $masjid->update($updateData);

            return response()->json([
                'message' => 'Masjid updated successfully',
                'data' => $masjid
            ]);
        } catch (\Exception $e) {
            \Log::error('Failed to update masjid: ' . $e->getMessage());
            return response()->json([
                'message' => 'Failed to update masjid',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Remove the specified masjid from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $masjid = Masjid::findOrFail($id);
        $masjid->delete();
        return response()->json(['message' => 'Masjid deleted successfully']);
    }

    /**
     * Find nearby masjids based on latitude, longitude and radius.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function nearby(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'lat' => 'required|numeric',
            'lng' => 'required|numeric',
            'radius' => 'nullable|numeric|min:0.1|max:100',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $lat = $request->input('lat');
        $lng = $request->input('lng');
        $radius = $request->input('radius', 10); // Default 10 miles

        // Convert miles to kilometers (1 mile = 1.60934 km)
        $radiusKm = $radius * 1.60934;

        $masjids = Masjid::nearby($lat, $lng, $radiusKm)->get();

        return response()->json([
            'data' => $masjids,
            'meta' => [
                'lat' => $lat,
                'lng' => $lng,
                'radius_miles' => $radius,
                'count' => $masjids->count(),
            ]
        ]);
    }
}