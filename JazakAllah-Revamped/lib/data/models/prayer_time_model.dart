import 'dart:convert';

class PrayerTimeModel {
  final int? id;
  final int masjidId;
  final String date;
  final Map<String, dynamic> prayerData;
  final String source;
  final String? timetableImage;

  PrayerTimeModel({
    this.id,
    required this.masjidId,
    required this.date,
    required this.prayerData,
    this.source = 'manual',
    this.timetableImage,
  });

  factory PrayerTimeModel.fromJson(Map<String, dynamic> json) {
    return PrayerTimeModel(
      id: json['id'],
      masjidId: json['masjid_id'],
      date: json['date'] as String,
      prayerData: Map<String, dynamic>.from(json['prayer_times'] as Map),
      source: json['source'] ?? 'manual',
      timetableImage: json['timetable_image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'masjid_id': masjidId,
      'date': date,
      'prayer_times': prayerData,
      'source': source,
      'timetable_image': timetableImage,
    };
  }

  String getPrayerTime(String prayer) {
    if (prayerData[prayer] is Map<String, dynamic>) {
      return (prayerData[prayer] as Map<String, dynamic>)['adhan']
              ?.toString() ??
          'N/A';
    }
    return prayerData[prayer]?.toString() ?? 'N/A';
  }

  String getJamaatTime(String prayer) {
    if (!prayerData.containsKey(prayer)) {
      return 'N/A';
    }

    if (prayerData[prayer] is! Map<String, dynamic>) {
      return 'N/A';
    }

    final prayerMap = prayerData[prayer] as Map<String, dynamic>;
    return prayerMap['jamaat']?.toString() ?? 'N/A';
  }

  bool hasJamaatTime(String prayer) {
    if (!prayerData.containsKey(prayer)) {
      return false;
    }

    if (prayerData[prayer] is! Map<String, dynamic>) {
      return false;
    }

    final prayerMap = prayerData[prayer] as Map<String, dynamic>;
    return prayerMap.containsKey('jamaat') && prayerMap['jamaat'] != null;
  }
}
