import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/masjid_model.dart';
import '../../models/prayer_time_model.dart';
import '../../services/masjid_service.dart';
import 'package:http/http.dart' as http;
import '../../utility/urls.dart';
import '../../services/widget_service.dart';
import 'package:intl/intl.dart';
import 'package:adhan/adhan.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MasjidProvider extends ChangeNotifier {
  final MasjidService _masjidService = MasjidService();

  List<MasjidModel> _masjids = [];
  List<MasjidModel> _nearbyMasjids = [];
  final Map<int, List<PrayerTimeModel>> _prayerTimes = {};
  List<PrayerTimeModel> _allPrayerTimes = [];
  MasjidModel? _selectedMasjid;
  bool _isLoading = false;
  String _error = '';

  List<MasjidModel> get masjids => _masjids;
  List<MasjidModel> get nearbyMasjids => _nearbyMasjids;
  Map<int, List<PrayerTimeModel>> get prayerTimes => _prayerTimes;
  List<PrayerTimeModel> get allPrayerTimes => _allPrayerTimes;
  MasjidModel? get selectedMasjid => _selectedMasjid;
  bool get isLoading => _isLoading;
  String get error => _error;

  // Load masjids from API
  Future<void> getMasjids() async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      _masjids = await _masjidService.getMasjids();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  // Get a specific masjid
  Future<MasjidModel?> getMasjid(int id) async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      final masjid = await _masjidService.getMasjid(id);
      _selectedMasjid = masjid;
      _isLoading = false;
      notifyListeners();
      return masjid;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return null;
    }
  }

  // Add a new masjid
  Future<MasjidModel?> addMasjid(MasjidModel masjid) async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      final newMasjid = await _masjidService.addMasjid(masjid);
      _masjids.add(newMasjid);
      _isLoading = false;
      notifyListeners();
      return newMasjid;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return null;
    }
  }

  // Update a masjid
  Future<MasjidModel?> updateMasjid(
      int id, Map<String, dynamic> updates) async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      final updatedMasjid = await _masjidService.updateMasjid(id, updates);

      // Update in the masjids list
      final index = _masjids.indexWhere((m) => m.id == id);
      if (index != -1) {
        _masjids[index] = updatedMasjid;
      }

      // Update in the nearby masjids list
      final nearbyIndex = _nearbyMasjids.indexWhere((m) => m.id == id);
      if (nearbyIndex != -1) {
        _nearbyMasjids[nearbyIndex] = updatedMasjid;
      }

      // Update selected masjid if it's the same
      if (_selectedMasjid?.id == id) {
        _selectedMasjid = updatedMasjid;
      }

      _isLoading = false;
      notifyListeners();
      return updatedMasjid;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return null;
    }
  }

  // Delete a masjid
  Future<bool> deleteMasjid(int id) async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      final success = await _masjidService.deleteMasjid(id);

      if (success) {
        // Remove from the masjids list
        _masjids.removeWhere((m) => m.id == id);

        // Remove from the nearby masjids list
        _nearbyMasjids.removeWhere((m) => m.id == id);

        // Clear selected masjid if it's the same
        if (_selectedMasjid?.id == id) {
          _selectedMasjid = null;
        }

        // Remove prayer times for this masjid
        _prayerTimes.remove(id);
        _allPrayerTimes.removeWhere((pt) => pt.masjidId == id);
      }

      _isLoading = false;
      notifyListeners();
      return success;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Load nearby masjids
  Future<void> getNearbyMasjids(double lat, double lng,
      {double radius = 10}) async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      _nearbyMasjids =
          await _masjidService.getNearbyMasjids(lat, lng, radius: radius);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  // Set selected masjid
  void setSelectedMasjid(MasjidModel masjid) {
    _selectedMasjid = masjid;
    notifyListeners();
  }

  // Clear selected masjid
  void clearSelectedMasjid() {
    _selectedMasjid = null;
    notifyListeners();
  }

  // Load prayer times for a masjid
  Future<List<PrayerTimeModel>> getMasjidPrayerTimes(int masjidId,
      {String? startDate, String? endDate}) async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      final prayerTimesList = await _masjidService.getMasjidPrayerTimes(
          masjidId,
          startDate: startDate,
          endDate: endDate);

      _prayerTimes[masjidId] = prayerTimesList;
      _isLoading = false;
      notifyListeners();

      return prayerTimesList;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return [];
    }
  }

  // Load all prayer times
  Future<void> getAllPrayerTimes(
      {String? startDate, String? endDate, int? masjidId}) async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      _allPrayerTimes = await _masjidService.getAllPrayerTimes(
          startDate: startDate, endDate: endDate, masjidId: masjidId);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  // Add prayer time
  Future<PrayerTimeModel?> addPrayerTime(PrayerTimeModel prayerTime) async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      final newPrayerTime = await _masjidService.addPrayerTime(prayerTime);

      // Add to the prayer times map
      if (_prayerTimes.containsKey(prayerTime.masjidId)) {
        _prayerTimes[prayerTime.masjidId]!.add(newPrayerTime);
      } else {
        _prayerTimes[prayerTime.masjidId] = [newPrayerTime];
      }

      // Add to all prayer times list
      _allPrayerTimes.add(newPrayerTime);

      // Update widget if this is for the selected masjid
      // if (_selectedMasjid?.id == prayerTime.masjidId) {
      //   await updateWidgetAfterChanges(newPrayerTime);
      // }

      _isLoading = false;
      notifyListeners();
      return newPrayerTime;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return null;
    }
  }

  // Update prayer time
  Future<PrayerTimeModel?> updatePrayerTime(
      int id, Map<String, dynamic> updates) async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      final updatedPrayerTime =
          await _masjidService.updatePrayerTime(id, updates);

      // Update in the prayer times map
      if (_prayerTimes.containsKey(updatedPrayerTime.masjidId)) {
        final index = _prayerTimes[updatedPrayerTime.masjidId]!
            .indexWhere((pt) => pt.id == id);
        if (index != -1) {
          _prayerTimes[updatedPrayerTime.masjidId]![index] = updatedPrayerTime;
        }
      }

      // Update in all prayer times list
      final allIndex = _allPrayerTimes.indexWhere((pt) => pt.id == id);
      if (allIndex != -1) {
        _allPrayerTimes[allIndex] = updatedPrayerTime;
      }

      // Update widget if this is for the selected masjid
      // if (_selectedMasjid?.id == id) {
      //   await updateWidgetAfterChanges(updatedPrayerTime);
      // }

      _isLoading = false;
      notifyListeners();
      return updatedPrayerTime;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return null;
    }
  }

  // Delete prayer time
  Future<bool> deletePrayerTime(int id) async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      final success = await _masjidService.deletePrayerTime(id);

      if (success) {
        // Find the prayer time to get its masjid ID
        final prayerTime = _allPrayerTimes.firstWhere((pt) => pt.id == id,
            orElse: () => _prayerTimes.values.expand((list) => list).firstWhere(
                (pt) => pt.id == id,
                orElse: () =>
                    PrayerTimeModel(masjidId: -1, date: '', prayerData: {})));

        // Remove from the prayer times map
        if (prayerTime.masjidId != -1 &&
            _prayerTimes.containsKey(prayerTime.masjidId)) {
          _prayerTimes[prayerTime.masjidId]!.removeWhere((pt) => pt.id == id);
        }

        // Remove from all prayer times list
        _allPrayerTimes.removeWhere((pt) => pt.id == id);
      }

      _isLoading = false;
      notifyListeners();
      return success;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Scan timetable
  Future<Map<String, dynamic>?> scanTimetable(
      int masjidId, File imageFile) async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      final result = await _masjidService.scanTimetable(masjidId, imageFile);

      // Update prayer times if scan was successful
      if (result['data'] != null && result['data']['prayer_times'] != null) {
        final List<dynamic> prayerTimesData = result['data']['prayer_times'];
        final prayerTimesList =
            prayerTimesData.map((pt) => PrayerTimeModel.fromJson(pt)).toList();

        // Update the prayer times map
        _prayerTimes[masjidId] = prayerTimesList;

        // Update all prayer times list
        _allPrayerTimes.removeWhere((pt) => pt.masjidId == masjidId);
        _allPrayerTimes.addAll(prayerTimesList);
      }

      _isLoading = false;
      notifyListeners();
      return result;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return null;
    }
  }

  // Clear error
  void clearError() {
    _error = '';
    notifyListeners();
  }

  // Add this method to your existing MasjidProvider class
  Future<PrayerTimeModel?> addPrayerTimes(PrayerTimeModel prayerTime) async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      // API call
      final response = await http.post(
        Uri.parse('${Urls.baseUrl}/api/prayer-times'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(prayerTime.toJson()),
      );

      if (response.statusCode == 201) {
        final newPrayerTime =
            PrayerTimeModel.fromJson(jsonDecode(response.body));

        // Update local cache
        if (_prayerTimes.containsKey(prayerTime.masjidId)) {
          _prayerTimes[prayerTime.masjidId]!.add(newPrayerTime);
        } else {
          _prayerTimes[prayerTime.masjidId] = [newPrayerTime];
        }

        _isLoading = false;
        notifyListeners();
        return newPrayerTime;
      } else {
        _error = 'Failed to add prayer times: ${response.body}';
        _isLoading = false;
        notifyListeners();
        return null;
      }
    } catch (e) {
      _error = 'Error adding prayer times: $e';
      _isLoading = false;
      notifyListeners();
      return null;
    }
  }

  // Add this method for offline caching
  Future<void> cachePrayerTimes() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final prayerTimesJson = jsonEncode(_prayerTimes.map((key, value) =>
          MapEntry(key.toString(), value.map((pt) => pt.toJson()).toList())));

      await prefs.setString('cached_prayer_times', prayerTimesJson);
    } catch (e) {
      print('Error caching prayer times: $e');
    }
  }

  // Add this method to load cached prayer times
  Future<void> loadCachedPrayerTimes() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final cachedData = prefs.getString('cached_prayer_times');

      if (cachedData != null) {
        final decoded = jsonDecode(cachedData) as Map<String, dynamic>;

        _prayerTimes.clear();
        decoded.forEach((key, value) {
          final masjidId = int.parse(key);
          final prayerTimesList = (value as List)
              .map((item) => PrayerTimeModel.fromJson(item))
              .toList();
          _prayerTimes[masjidId] = prayerTimesList;
        });

        notifyListeners();
      }
    } catch (e) {
      print('Error loading cached prayer times: $e');
    }
  }

  // After loading or saving prayer times
  // Future<void> updateWidgetAfterChanges(PrayerTimeModel? prayerTime) async {
  //   if (prayerTime != null && _selectedMasjid != null) {
  //     await WidgetService.updatePrayerTimesWidget(prayerTime, _selectedMasjid!);
  //   }
  // }

  // Method to load the user's selected masjid from storage
  Future<void> loadSelectedMasjid() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedMasjidId = prefs.getInt('selected_masjid_id');

      if (savedMasjidId == null) {
        _selectedMasjid = null;
        return;
      }

      // Try to find in existing masjids list first
      if (_masjids.isNotEmpty) {
        final existingMasjid = _masjids.firstWhere(
          (m) => m.id == savedMasjidId,
          orElse: () => MasjidModel(
              id: -1, name: '', address: '', latitude: 0.0, longitude: 0.0),
        );

        if (existingMasjid.id != -1) {
          _selectedMasjid = existingMasjid;
          notifyListeners();
          return;
        }
      }

      // Otherwise load from API
      await getMasjid(savedMasjidId);
    } catch (e) {
      _error = 'Failed to load selected masjid: $e';
      print(_error);
    }
  }

  // Method to get a masjid by ID
  Future<MasjidModel?> getMasjidById(int masjidId) async {
    try {
      // First try to get from cached list
      if (_masjids.isNotEmpty) {
        final cachedMasjid = _masjids.firstWhere(
          (m) => m.id == masjidId,
          orElse: () => MasjidModel(
              id: -1, name: '', address: '', latitude: 0.0, longitude: 0.0),
        );

        if (cachedMasjid.id != -1) {
          return cachedMasjid;
        }
      }

      // If not in cache, fetch from API
      final response = await http.get(
        Uri.parse('${Urls.baseUrl}/api/masjids/$masjidId'),
      );

      if (response.statusCode == 200) {
        return MasjidModel.fromJson(jsonDecode(response.body)['data']);
      } else {
        _error = 'Failed to load masjid: ${response.statusCode}';
        return null;
      }
    } catch (e) {
      _error = 'Error fetching masjid: $e';
      print(_error);
      return null;
    }
  }

  // Method to get prayer times for a specific date
  Future<PrayerTimeModel?> getPrayerTimesForDate(
      int masjidId, DateTime date) async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      final formattedDate = DateFormat('yyyy-MM-dd').format(date);

      // Check if we have cached prayer times for this masjid and date
      if (_prayerTimes.containsKey(masjidId)) {
        final cachedPrayerTime = _prayerTimes[masjidId]!.firstWhere(
            (pt) => pt.date == formattedDate,
            orElse: () =>
                PrayerTimeModel(masjidId: -1, date: '', prayerData: {}));

        if (cachedPrayerTime.masjidId != -1) {
          _isLoading = false;
          notifyListeners();
          return cachedPrayerTime;
        }
      }

      // If not found in cache, try to fetch from API
      final uri =
          Uri.parse('${Urls.baseUrl}/api/masjids/$masjidId/prayer-times')
              .replace(queryParameters: {'date': formattedDate});

      final response = await http.get(uri);

      if (response.statusCode == 200 && response.body.isNotEmpty) {
        final data = jsonDecode(response.body);

        if (data['data'] != null) {
          PrayerTimeModel prayerTime;

          if (data['data'] is List) {
            if (data['data'].isEmpty) {
              // No data returned, fallback to calculated
              _isLoading = false;
              notifyListeners();
              return _calculatePrayerTimes(masjidId, date);
            }

            prayerTime = PrayerTimeModel.fromJson(data['data'][0]);
          } else {
            prayerTime = PrayerTimeModel.fromJson(data['data']);
          }

          // Cache the result
          if (_prayerTimes.containsKey(masjidId)) {
            _prayerTimes[masjidId]!.add(prayerTime);
          } else {
            _prayerTimes[masjidId] = [prayerTime];
          }

          _isLoading = false;
          notifyListeners();
          return prayerTime;
        }
      }

      // If API call fails, calculate prayer times
      final calculatedTimes = await _calculatePrayerTimes(masjidId, date);
      _isLoading = false;
      notifyListeners();
      return calculatedTimes;
    } catch (e) {
      _error = 'Error fetching prayer times: $e';
      _isLoading = false;
      notifyListeners();

      // Fallback to calculation if API fails
      return _calculatePrayerTimes(masjidId, date);
    }
  }

  // Fallback method to calculate prayer times if API doesn't provide them
  Future<PrayerTimeModel?> _calculatePrayerTimes(
      int masjidId, DateTime date) async {
    try {
      MasjidModel? masjid;

      // Try to find masjid in existing lists
      if (_selectedMasjid?.id == masjidId) {
        masjid = _selectedMasjid;
      } else if (_masjids.isNotEmpty) {
        masjid = _masjids.firstWhere((m) => m.id == masjidId,
            orElse: () => MasjidModel(
                id: -1, name: '', address: '', latitude: 0.0, longitude: 0.0));

        if (masjid.id == -1) masjid = null;
      }

      // If not found, try to load from API
      if (masjid == null) {
        masjid = await getMasjid(masjidId);
      }

      if (masjid == null ||
          masjid.latitude == null ||
          masjid.longitude == null) {
        return null;
      }

      // Use adhan package to calculate prayer times
      final coordinates = Coordinates(masjid.latitude!, masjid.longitude!);
      final params = CalculationMethod.north_america.getParameters();
      params.madhab = Madhab.shafi;

      // Convert DateTime to DateComponents
      final dateComponents = DateComponents(date.year, date.month, date.day);
      final prayerTimes = PrayerTimes(coordinates, dateComponents, params);

      // Format prayer times
      final format = DateFormat.jm();

      // Create prayer data map
      final Map<String, dynamic> prayerData = {
        'fajr': format.format(prayerTimes.fajr),
        'dhuhr': format.format(prayerTimes.dhuhr),
        'asr': format.format(prayerTimes.asr),
        'maghrib': format.format(prayerTimes.maghrib),
        'isha': format.format(prayerTimes.isha),
      };

      // Create and return prayer time model
      return PrayerTimeModel(
        masjidId: masjidId,
        date: DateFormat('yyyy-MM-dd').format(date),
        prayerData: prayerData,
        source: 'calculated',
      );
    } catch (e) {
      _error = 'Error calculating prayer times: $e';
      print(_error);
      return null;
    }
  }
}

void backgroundCallback(Uri? uri) async {
  if (uri?.host == 'updatewidget') {
    try {
      await dotenv.load();

      // Create a new instance with proper initialization
      final masjidProvider = MasjidProvider();

      // Get selected masjid ID from shared preferences directly
      final prefs = await SharedPreferences.getInstance();
      final masjidId = prefs.getInt('selected_masjid_id');

      if (masjidId != null) {
        // Get masjid details
        final masjid = await masjidProvider.getMasjid(masjidId);

        if (masjid != null) {
          // Get prayer times for today using existing method
          final todayStr = DateFormat('yyyy-MM-dd').format(DateTime.now());
          final prayerTimesList = await masjidProvider.getMasjidPrayerTimes(
              masjidId,
              startDate: todayStr,
              endDate: todayStr);

          // if (prayerTimesList.isNotEmpty) {
          //   await WidgetService.updatePrayerTimesWidget(
          //       prayerTimesList.first, masjid);
          // }
        }
      }
    } catch (e) {
      print('Error in background widget update: $e');
    }
  }
}

// Also modify _updateWidgetOnStart
Future<void> _updateWidgetOnStart() async {
  try {
    // Access shared preferences directly
    final prefs = await SharedPreferences.getInstance();
    final masjidId = prefs.getInt('selected_masjid_id');

    if (masjidId != null) {
      final masjidProvider = MasjidProvider();
      final masjid = await masjidProvider.getMasjid(masjidId);

      if (masjid != null) {
        // Use existing method to get prayer times
        final todayStr = DateFormat('yyyy-MM-dd').format(DateTime.now());
        final prayerTimesList = await masjidProvider.getMasjidPrayerTimes(
            masjidId,
            startDate: todayStr,
            endDate: todayStr);

        // if (prayerTimesList.isNotEmpty) {
        //   await WidgetService.updatePrayerTimesWidget(
        //       prayerTimesList.first, masjid);
        // }
      }
    }
  } catch (e) {
    print('Error updating widget on start: $e');
  }
}
