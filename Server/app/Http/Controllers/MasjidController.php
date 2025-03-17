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
        $masjids = Masjid::all();
        return response()->json(['data' => $masjids]);
    }

    /**
     * Store a newly created masjid in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'address' => 'required|string',
            'latitude' => 'nullable|numeric',
            'longitude' => 'nullable|numeric',
            'contact_info' => 'nullable|array',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $masjid = Masjid::create($request->all());
        return response()->json(['data' => $masjid], 201);
    }

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
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $masjid->update($request->all());
        return response()->json(['data' => $masjid]);
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