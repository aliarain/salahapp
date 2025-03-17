import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../constants/colors.dart';
import '../../../data/models/masjid_model.dart';
import '../../../data/viewmodel/Providers/masjid_provider.dart';
import '../views/masjids/masjid_detail_screen.dart';
import '../../../data/models/prayer_time_model.dart';

class HomePrayerTimesWidget extends StatelessWidget {
  const HomePrayerTimesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MasjidProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            color: AppColors.colorPrimaryDarker.withOpacity(0.8),
            child: Center(
              child: CircularProgressIndicator(
                color: AppColors.colorWhiteHighEmp,
              ),
            ),
          );
        }

        final selectedMasjid = provider.selectedMasjid;

        if (selectedMasjid == null) {
          return _buildNoMasjidSelected(context);
        }

        // Get today's date
        final today = DateTime.now();
        final dateFormat = DateFormat('yyyy-MM-dd');
        final todayFormatted = dateFormat.format(today);

        // Fix: Convert masjid.id to int if it's a string, or use a default value
        final masjidId = selectedMasjid.id != null
            ? int.tryParse(selectedMasjid.id.toString()) ?? -1
            : -1;

        // Get prayer times for today using the integer ID
        final masjidPrayerTimes = provider.prayerTimes[masjidId] ?? [];

        // Fix: Change the firstWhere to properly handle null case
        final todayPrayerTime = masjidPrayerTimes.isEmpty
            ? null
            : masjidPrayerTimes.firstWhere(
                (pt) => pt.date == todayFormatted,
                orElse: () => masjidPrayerTimes.first,
              );

        if (todayPrayerTime == null) {
          return _buildNoPrayerTimesAvailable(context, selectedMasjid);
        }

        return _buildPrayerTimesCard(context, selectedMasjid, todayPrayerTime);
      },
    );
  }

  Widget _buildNoMasjidSelected(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      color: AppColors.colorPrimaryDarker.withOpacity(0.8),
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.mosque,
                  color: AppColors.colorDonationGradient1End,
                  size: 24.sp,
                ),
                SizedBox(width: 8.w),
                Text(
                  'Prayer Times',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.colorWhiteHighEmp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Text(
              'No masjid selected for prayer times',
              style: TextStyle(
                fontSize: 16.sp,
                color: AppColors.colorWhiteMedEmp,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Select a masjid to display prayer times on your home screen',
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.colorWhiteLowEmp,
              ),
            ),
            SizedBox(height: 16.h),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/masjids');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.colorDonationGradient1End,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                minimumSize: Size(double.infinity, 48.h),
              ),
              child: Text(
                'Select Masjid',
                style: TextStyle(
                  color: AppColors.colorWhiteHighEmp,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNoPrayerTimesAvailable(
      BuildContext context, MasjidModel masjid) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      color: AppColors.colorPrimaryDarker.withOpacity(0.8),
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.mosque,
                  color: AppColors.colorDonationGradient1End,
                  size: 24.sp,
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    masjid.name,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.colorWhiteHighEmp,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Text(
              masjid.address,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.colorWhiteMedEmp,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 16.h),
            Text(
              'No prayer times available for today',
              style: TextStyle(
                fontSize: 16.sp,
                color: AppColors.colorWhiteMedEmp,
              ),
            ),
            SizedBox(height: 16.h),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MasjidDetailScreen(masjid: masjid),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.colorDonationGradient1End,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                minimumSize: Size(double.infinity, 48.h),
              ),
              child: Text(
                'Add Prayer Times',
                style: TextStyle(
                  color: AppColors.colorWhiteHighEmp,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPrayerTimesCard(BuildContext context, MasjidModel masjid,
      PrayerTimeModel todayPrayerTime) {
    // Get current time
    final now = DateTime.now();
    final currentTime = TimeOfDay.fromDateTime(now);

    // Format current date
    final dateFormat = DateFormat('EEEE, MMMM d');
    final formattedDate = dateFormat.format(now);

    // Determine next prayer
    String nextPrayer = 'fajr';
    String nextPrayerTime = todayPrayerTime.getPrayerTime('fajr');

    final prayers = ['fajr', 'dhuhr', 'asr', 'maghrib', 'isha'];
    final prayerNames = ['Fajr', 'Dhuhr', 'Asr', 'Maghrib', 'Isha'];

    for (int i = 0; i < prayers.length; i++) {
      final prayerTime = todayPrayerTime.getPrayerTime(prayers[i]);
      if (prayerTime != 'N/A') {
        final timeParts = prayerTime.split(':');
        if (timeParts.length == 2) {
          final hour = int.tryParse(timeParts[0]) ?? 0;
          final minute = int.tryParse(timeParts[1]) ?? 0;
          final prayer = TimeOfDay(hour: hour, minute: minute);

          if (_compareTimeOfDay(currentTime, prayer) <= 0) {
            nextPrayer = prayers[i];
            nextPrayerTime = prayerTime;
            break;
          }
        }
      }
    }

    String formatPrayerTime(String time) {
      if (time == 'N/A') return time;
      try {
        final timeParts = time.split(':');
        if (timeParts.length != 2) return 'Invalid';
        final hour = int.tryParse(timeParts[0]);
        final minute = int.tryParse(timeParts[1]);
        if (hour == null || minute == null) return 'Invalid';
        return TimeOfDay(hour: hour, minute: minute).format(context);
      } catch (e) {
        return 'Invalid';
      }
    }

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      color: AppColors.colorPrimaryDarker.withOpacity(0.8),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MasjidDetailScreen(masjid: masjid),
            ),
          );
        },
        borderRadius: BorderRadius.circular(12.r),
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.mosque,
                        color: AppColors.colorDonationGradient1End,
                        size: 24.sp,
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Text(
                          masjid.name,
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.colorWhiteHighEmp,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    formattedDate,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.colorWhiteMedEmp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),

              // Next prayer highlight
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(12.r),
                decoration: BoxDecoration(
                  color: AppColors.colorPrimaryLighter,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color: AppColors.colorDonationGradient1End,
                    width: 1.5,
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      'Next Prayer',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.colorWhiteMedEmp,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      prayerNames[prayers.indexOf(nextPrayer)],
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.colorWhiteHighEmp,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      formatPrayerTime(nextPrayerTime),
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.colorDonationGradient1End,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16.h),

              // All prayer times
              Row(
                children: [
                  _buildPrayerTimeColumn('Fajr',
                      formatPrayerTime(todayPrayerTime.getPrayerTime('fajr'))),
                  _buildPrayerTimeColumn('Dhuhr',
                      formatPrayerTime(todayPrayerTime.getPrayerTime('dhuhr'))),
                  _buildPrayerTimeColumn('Asr',
                      formatPrayerTime(todayPrayerTime.getPrayerTime('asr'))),
                  _buildPrayerTimeColumn(
                      'Maghrib',
                      formatPrayerTime(
                          todayPrayerTime.getPrayerTime('maghrib'))),
                  _buildPrayerTimeColumn('Isha',
                      formatPrayerTime(todayPrayerTime.getPrayerTime('isha'))),
                ],
              ),

              if (todayPrayerTime.prayerData.containsKey('jummah') &&
                  todayPrayerTime.prayerData['jummah'] != null &&
                  now.weekday == DateTime.friday)
                Padding(
                  padding: EdgeInsets.only(top: 16.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.event,
                        color: AppColors.colorDonationGradient1End,
                        size: 16.sp,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        'Jummah: ${formatPrayerTime(todayPrayerTime.getPrayerTime('jummah'))}',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.colorDonationGradient1End,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPrayerTimeColumn(String name, String time) {
    return Expanded(
      child: Column(
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.colorWhiteMedEmp,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            time,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.colorWhiteHighEmp,
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to compare TimeOfDay objects
  int _compareTimeOfDay(TimeOfDay time1, TimeOfDay time2) {
    if (time1.hour < time2.hour) return -1;
    if (time1.hour > time2.hour) return 1;
    if (time1.minute < time2.minute) return -1;
    if (time1.minute > time2.minute) return 1;
    return 0;
  }
}
