import 'package:flutter_dotenv/flutter_dotenv.dart';

class Urls {
  Urls._();

  static String baseUrl = 'https://api.yallasalah.co.uk/api';
  static String userSignUp = '$baseUrl/users/register';
  static String signIn = '$baseUrl/users/login';
  static String sendOTP = '$baseUrl/users/send-otp';
  static String verifyOTP = '$baseUrl/users/validate-otp';
  static String resetPassword = '$baseUrl/users/reset';
  static String getAllHadithApi = '$baseUrl/hadiths/all';
  static String getAllDuaApi = '$baseUrl/duas/all';
  static String getAllCurrency = '$baseUrl/zakats/find';
  static String deleteAccount = '$baseUrl/users/delete/';
  static String updateDonation = '$baseUrl/users/update-donation/';
  static String liveLink = '$baseUrl/link';

  // Masjid API Routes
  static String getAllMasjids = '$baseUrl/masjids';
  static String addMasjid = '$baseUrl/masjids';
  static String getNearbyMasjids = '$baseUrl/masjids/nearby';
  static String scanTimetable = '$baseUrl/scan-timetable';

  // Prayer Times API Routes
  static String getAllPrayerTimes = '$baseUrl/prayer-times';
  static String addPrayerTimes = '$baseUrl/prayer-times/add';

  static String getMasjid(int id) => '$baseUrl/masjids/$id';
  static String updateMasjid(int id) => '$baseUrl/masjids/update/$id';
  static String deleteMasjid(int id) => '$baseUrl/masjids/delete/$id';
  static String getMasjidPrayerTimes(int masjidId) =>
      '$baseUrl/masjids/$masjidId/prayer-times';
  static String getPrayerTime(int id) => '$baseUrl/prayer-times/find/$id';
  static String updatePrayerTime(int id) => '$baseUrl/prayer-times/update/$id';
  static String deletePrayerTime(int id) => '$baseUrl/prayer-times/delete/$id';

  static String getCategoryList(String categoryURL) =>
      '$baseUrl/$categoryURL/all';
  static String getSurahList = 'https://api.quran.gading.dev/surah';

  static String getSurahFull(int surahNumber) => '$getSurahList/$surahNumber';

  static String getHadithCategoryData(String categoryName) =>
      '$baseUrl/hadiths/category/$categoryName';

  static String getDuaCategoryData(String categoryName) =>
      '$baseUrl/duas/category/$categoryName';

  static String getAzkarCategoryData(String categoryName) =>
      '$baseUrl/azkars/category/$categoryName';

  static String getEventPrayerCategoryData(String categoryName) =>
      '$baseUrl/event-prayers/category/$categoryName';

  static String fetchUserData = '$baseUrl/users/find';
  static String fetchWallpapersData = '$baseUrl/wallpapers/all';

  static String updateUserData(String id) => '$baseUrl/users/update/$id';
}
