import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/masjid_model.dart';
import '../models/prayer_time_model.dart';
import '../utility/urls.dart';

class MasjidService {
  // Get all masjids
  Future<List<MasjidModel>> getMasjids() async {
    try {
      final response = await http.get(Uri.parse(Urls.getAllMasjids));
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        if (responseData['status'] == 'success' &&
            responseData['data'] != null) {
          final List<dynamic> data = responseData['data'];
          return data.map((masjid) => MasjidModel.fromJson(masjid)).toList();
        }
        return [];
      } else {
        throw Exception('Failed to load masjids');
      }
    } catch (e) {
      throw Exception('Failed to load masjids: $e');
    }
  }

  // Get a specific masjid
  Future<MasjidModel> getMasjid(int id) async {
    try {
      final response = await http.get(Uri.parse(Urls.getMasjid(id)));
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        if (responseData['status'] == 'success' &&
            responseData['data'] != null) {
          return MasjidModel.fromJson(responseData['data']);
        }
        throw Exception('Masjid not found');
      } else {
        throw Exception('Failed to load masjid');
      }
    } catch (e) {
      throw Exception('Failed to load masjid: $e');
    }
  }

  // Add a new masjid
  Future<MasjidModel> addMasjid(MasjidModel masjid) async {
    try {
      final response = await http.post(
        Uri.parse(Urls.addMasjid),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(masjid.toJson()),
      );

      if (response.statusCode == 201) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        if (responseData['status'] == 'success' &&
            responseData['data'] != null) {
          return MasjidModel.fromJson(responseData['data']);
        }
        throw Exception('Failed to create masjid');
      } else {
        throw Exception('Failed to create masjid: ${response.body}');
      }
    } catch (e) {
      throw Exception('Failed to create masjid: $e');
    }
  }

  // Update a masjid
  Future<MasjidModel> updateMasjid(int id, Map<String, dynamic> updates) async {
    try {
      final response = await http.post(
        Uri.parse(Urls.updateMasjid(id)),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(updates),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        if (responseData['status'] == 'success' &&
            responseData['data'] != null) {
          return MasjidModel.fromJson(responseData['data']);
        }
        throw Exception('Failed to update masjid');
      } else {
        throw Exception('Failed to update masjid: ${response.body}');
      }
    } catch (e) {
      throw Exception('Failed to update masjid: $e');
    }
  }

  // Delete a masjid
  Future<bool> deleteMasjid(int id) async {
    try {
      final response = await http.delete(Uri.parse(Urls.deleteMasjid(id)));

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        return responseData['status'] == 'success';
      } else {
        throw Exception('Failed to delete masjid');
      }
    } catch (e) {
      throw Exception('Failed to delete masjid: $e');
    }
  }

  // Find nearby masjids
  Future<List<MasjidModel>> getNearbyMasjids(double lat, double lng,
      {double radius = 10}) async {
    try {
      final response = await http.get(Uri.parse(
          '${Urls.getNearbyMasjids}?lat=$lat&lng=$lng&radius=$radius'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        if (responseData['status'] == 'success' &&
            responseData['data'] != null) {
          final List<dynamic> data = responseData['data'];
          return data.map((masjid) => MasjidModel.fromJson(masjid)).toList();
        }
        return [];
      } else {
        throw Exception('Failed to load nearby masjids');
      }
    } catch (e) {
      throw Exception('Failed to load nearby masjids: $e');
    }
  }

  // Get prayer times for a masjid
  Future<List<PrayerTimeModel>> getMasjidPrayerTimes(int masjidId,
      {String? startDate, String? endDate}) async {
    try {
      String url = Urls.getMasjidPrayerTimes(masjidId);
      if (startDate != null) {
        url += '?start_date=$startDate';
        if (endDate != null) {
          url += '&end_date=$endDate';
        }
      }

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        if (responseData['status'] == 'success' &&
            responseData['data'] != null) {
          final List<dynamic> data = responseData['data']['prayer_times'] ?? [];
          return data
              .map((prayerTime) => PrayerTimeModel.fromJson(prayerTime))
              .toList();
        }
        return [];
      } else {
        throw Exception('Failed to load prayer times');
      }
    } catch (e) {
      throw Exception('Failed to load prayer times: $e');
    }
  }

  // Get all prayer times
  Future<List<PrayerTimeModel>> getAllPrayerTimes(
      {String? startDate, String? endDate, int? masjidId}) async {
    try {
      String url = Urls.getAllPrayerTimes;
      List<String> queryParams = [];

      if (startDate != null) queryParams.add('start_date=$startDate');
      if (endDate != null) queryParams.add('end_date=$endDate');
      if (masjidId != null) queryParams.add('masjid_id=$masjidId');

      if (queryParams.isNotEmpty) {
        url += '?' + queryParams.join('&');
      }

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        if (responseData['status'] == 'success' &&
            responseData['data'] != null) {
          final List<dynamic> data = responseData['data'];
          return data
              .map((prayerTime) => PrayerTimeModel.fromJson(prayerTime))
              .toList();
        }
        return [];
      } else {
        throw Exception('Failed to load prayer times');
      }
    } catch (e) {
      throw Exception('Failed to load prayer times: $e');
    }
  }

  // Add prayer times
  Future<PrayerTimeModel> addPrayerTime(PrayerTimeModel prayerTime) async {
    try {
      final response = await http.post(
        Uri.parse(Urls.addPrayerTimes),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(prayerTime.toJson()),
      );

      if (response.statusCode == 201) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        if (responseData['status'] == 'success' &&
            responseData['data'] != null) {
          return PrayerTimeModel.fromJson(responseData['data']);
        }
        throw Exception('Failed to add prayer time');
      } else {
        throw Exception('Failed to add prayer time: ${response.body}');
      }
    } catch (e) {
      throw Exception('Failed to add prayer time: $e');
    }
  }

  // Update prayer time
  Future<PrayerTimeModel> updatePrayerTime(
      int id, Map<String, dynamic> updates) async {
    try {
      final response = await http.post(
        Uri.parse(Urls.updatePrayerTime(id)),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(updates),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        if (responseData['status'] == 'success' &&
            responseData['data'] != null) {
          return PrayerTimeModel.fromJson(responseData['data']);
        }
        throw Exception('Failed to update prayer time');
      } else {
        throw Exception('Failed to update prayer time: ${response.body}');
      }
    } catch (e) {
      throw Exception('Failed to update prayer time: $e');
    }
  }

  // Delete prayer time
  Future<bool> deletePrayerTime(int id) async {
    try {
      final response = await http.delete(Uri.parse(Urls.deletePrayerTime(id)));

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        return responseData['status'] == 'success';
      } else {
        throw Exception('Failed to delete prayer time');
      }
    } catch (e) {
      throw Exception('Failed to delete prayer time: $e');
    }
  }

  // Scan timetable image
  Future<Map<String, dynamic>> scanTimetable(
      int masjidId, File imageFile) async {
    try {
      var request =
          http.MultipartRequest('POST', Uri.parse(Urls.scanTimetable));

      request.fields['masjid_id'] = masjidId.toString();
      request.files
          .add(await http.MultipartFile.fromPath('image', imageFile.path));

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        if (responseData['status'] == 'success') {
          return responseData;
        }
        throw Exception('Failed to scan timetable: ${responseData['message']}');
      } else {
        throw Exception('Failed to scan timetable: ${response.body}');
      }
    } catch (e) {
      throw Exception('Failed to scan timetable: $e');
    }
  }
}
