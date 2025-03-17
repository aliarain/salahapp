import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:provider/provider.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'app.dart';
import 'constants/localization/dependency_inj.dart';
import 'data/viewmodel/Providers/counter_provider.dart';
import 'data/viewmodel/Providers/gpt_provider.dart';
import 'data/viewmodel/Providers/hadith_provider.dart';
import 'data/viewmodel/Providers/link_provider.dart';
import 'data/viewmodel/Providers/location_provider.dart';
import 'data/viewmodel/Providers/note_provider.dart';
import 'data/viewmodel/Providers/user_provider.dart';
import 'data/viewmodel/Providers/wallpaper_provider.dart';
import 'data/services/notification_service.dart';
import 'data/viewmodel/Providers/masjid_provider.dart';
// import 'package:home_widget/home_widget.dart';
// import 'data/services/widget_service.dart';
// import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationServices().initNotification();
  tz.initializeTimeZones();

  //.env file define
  await dotenv.load(fileName: "assets/.env");

  //Initialize Firebase
  try {
    await Firebase.initializeApp();
    print('Firebase initialize successfully');
  } catch (e) {
    print('Error initializing firebase: $e');
  }

  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  OneSignal.initialize(dotenv.env['oneSignalKey'].toString());
  OneSignal.Notifications.requestPermission(true).then((accepted) {
    print("Accepted permission: $accepted");
  });

  Map<String, Map<String, String>> _languages = await LanguageDependency.init();

  // Initialize InApp Purchase
  // await PurchaseApi.init();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        // systemNavigationBarColor: AppColors.colorPrimary,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light),
  );

  // COMMENT OUT THESE LINES
  // HomeWidget.setAppGroupId('YOUR_GROUP_ID');
  // HomeWidget.registerBackgroundCallback(backgroundCallback);
  // await _updateWidgetOnStart();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NoteProvider()),
        ChangeNotifierProvider(create: (context) => ZikirProvider()),
        ChangeNotifierProvider(create: (context) => LocationProvider()),
        ChangeNotifierProvider(create: (context) => HadithProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => GPTProvider()),
        ChangeNotifierProvider(create: (context) => WallPaperProvider()),
        ChangeNotifierProvider(create: (context) => LinkProvider()),
        ChangeNotifierProvider(create: (context) => MasjidProvider()),
      ],
      child: JazakAllah(languages: _languages),
    ),
  );
}

// COMMENT OUT THESE FUNCTIONS
/*
void backgroundCallback(Uri? uri) async {
  if (uri?.host == 'updatewidget') {
    try {
      await dotenv.load();

      // Create a new instance
      final masjidProvider = MasjidProvider();

      // Use SharedPreferences directly instead of loadSelectedMasjid
      final prefs = await SharedPreferences.getInstance();
      final savedMasjidId = prefs.getInt('selected_masjid_id');

      if (savedMasjidId != null) {
        // Use getMasjid instead
        final masjid = await masjidProvider.getMasjid(savedMasjidId);

        if (masjid != null) {
          // Use getMasjidPrayerTimes instead of getPrayerTimesForDate
          final today = DateTime.now();
          final todayFormatted =
              "${today.year}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}";

          final prayerTimes = await masjidProvider.getMasjidPrayerTimes(
              savedMasjidId,
              startDate: todayFormatted,
              endDate: todayFormatted);

          if (prayerTimes.isNotEmpty) {
            await WidgetService.updatePrayerTimesWidget(
                prayerTimes.first, masjid);
          }
        }
      }
    } catch (e) {
      print('Error in background widget update: $e');
    }
  }
}

// Add this method to update widget on app start
Future<void> _updateWidgetOnStart() async {
  try {
    // Use SharedPreferences directly
    final prefs = await SharedPreferences.getInstance();
    final savedMasjidId = prefs.getInt('selected_masjid_id');

    if (savedMasjidId != null) {
      final masjidProvider = MasjidProvider();

      // Use existing getMasjid method
      final masjid = await masjidProvider.getMasjid(savedMasjidId);

      if (masjid != null) {
        // Use existing getMasjidPrayerTimes method
        final today = DateTime.now();
        final todayFormatted =
            "${today.year}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}";

        final prayerTimes = await masjidProvider.getMasjidPrayerTimes(
            savedMasjidId,
            startDate: todayFormatted,
            endDate: todayFormatted);

        if (prayerTimes.isNotEmpty) {
          await WidgetService.updatePrayerTimesWidget(
              prayerTimes.first, masjid);
        }
      }
    }
  } catch (e) {
    print('Error updating widget on start: $e');
  }
}
*/
