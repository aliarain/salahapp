// import 'package:home_widget/home_widget.dart';
// import '../models/prayer_time_model.dart';
// import '../models/masjid_model.dart';
// import 'package:adhan/adhan.dart';

// class WidgetService {
//   static Future<void> updatePrayerTimesWidget(
//       PrayerTimeModel prayerTime, MasjidModel masjid) async {
//     try {
//       // Update widget data
//       await HomeWidget.saveWidgetData('masjid_name', masjid.name);

//       // Save prayer times
//       if (prayerTime.prayerData.containsKey('fajr')) {
//         await HomeWidget.saveWidgetData('fajr', prayerTime.prayerData['fajr']);
//       }
//       if (prayerTime.prayerData.containsKey('dhuhr')) {
//         await HomeWidget.saveWidgetData(
//             'dhuhr', prayerTime.prayerData['dhuhr']);
//       }
//       if (prayerTime.prayerData.containsKey('asr')) {
//         await HomeWidget.saveWidgetData('asr', prayerTime.prayerData['asr']);
//       }
//       if (prayerTime.prayerData.containsKey('maghrib')) {
//         await HomeWidget.saveWidgetData(
//             'maghrib', prayerTime.prayerData['maghrib']);
//       }
//       if (prayerTime.prayerData.containsKey('isha')) {
//         await HomeWidget.saveWidgetData('isha', prayerTime.prayerData['isha']);
//       }

//       // Save update time
//       await HomeWidget.saveWidgetData(
//           'last_updated', DateTime.now().toIso8601String());

//       // Update the widget
//       await HomeWidget.updateWidget(
//         name: 'PrayerTimesWidgetProvider',
//         androidName: 'PrayerTimesWidgetProvider',
//         iOSName: 'PrayerTimesWidget',
//       );
//     } catch (e) {
//       print('Error updating widget: $e');
//     }
//   }
// }
