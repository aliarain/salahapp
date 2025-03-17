import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../constants/colors.dart';
import '../../../constants/images.dart';
import '../../../data/models/masjid_model.dart';
import '../../../data/models/prayer_time_model.dart';
import '../../../data/viewmodel/Providers/masjid_provider.dart';
import '../../widgets/app_background_image_widget.dart';
import '../../widgets/custom_appbar_widget.dart';
import 'scan_timetable_screen.dart';

class MasjidDetailScreen extends StatefulWidget {
  final MasjidModel masjid;

  const MasjidDetailScreen({
    Key? key,
    required this.masjid,
  }) : super(key: key);

  @override
  _MasjidDetailScreenState createState() => _MasjidDetailScreenState();
}

class _MasjidDetailScreenState extends State<MasjidDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');
  final DateFormat _displayDateFormat = DateFormat('EEEE, MMMM d, yyyy');

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    // Load prayer times for this masjid
    _loadPrayerTimes();
  }

  void _loadPrayerTimes() {
    if (widget.masjid.id != null) {
      // Get today's date
      final today = DateTime.now();
      final startDate = _dateFormat.format(today);

      // Get date 7 days from now
      final endDate = _dateFormat.format(today.add(Duration(days: 7)));

      // Load prayer times
      Provider.of<MasjidProvider>(context, listen: false).getMasjidPrayerTimes(
          widget.masjid.id!,
          startDate: startDate,
          endDate: endDate);
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          AppBackgroundImageWidget(
            bgImagePath: AssetsPath.secondaryBGSVG,
          ),
          CustomAppbarWidget(
            screenTitle: widget.masjid.name,
            actions: [
              IconButton(
                icon: Icon(
                  Icons.document_scanner,
                  color: AppColors.colorWhiteHighEmp,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ScanTimetableScreen(masjid: widget.masjid),
                    ),
                  );
                },
                tooltip: 'Scan Timetable',
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 70.h),
            child: Column(
              children: [
                // Masjid Header
                _buildMasjidHeader(),

                // Tab Bar
                Container(
                  color: AppColors.colorPrimaryDarker,
                  child: TabBar(
                    controller: _tabController,
                    indicatorColor: AppColors.colorDonationGradient1End,
                    labelColor: AppColors.colorWhiteHighEmp,
                    unselectedLabelColor: AppColors.colorWhiteMedEmp,
                    tabs: [
                      Tab(text: 'Prayer Times'),
                      Tab(text: 'Information'),
                    ],
                  ),
                ),

                // Tab Content
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _buildPrayerTimesTab(),
                      _buildInformationTab(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to add prayer time screen
          // Will be implemented later
        },
        backgroundColor: AppColors.colorDonationGradient1End,
        child: Icon(
          Icons.add_alarm,
          color: AppColors.colorWhiteHighEmp,
        ),
        tooltip: 'Add Prayer Time',
      ),
    );
  }

  Widget _buildMasjidHeader() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.colorPrimaryDarker.withOpacity(0.8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.masjid.image != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.network(
                widget.masjid.image!,
                width: double.infinity,
                height: 150.h,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: double.infinity,
                  height: 150.h,
                  decoration: BoxDecoration(
                    color: AppColors.colorPrimaryLighter,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Icon(
                    Icons.mosque,
                    color: AppColors.colorWhiteHighEmp,
                    size: 50.sp,
                  ),
                ),
              ),
            )
          else
            Container(
              width: double.infinity,
              height: 150.h,
              decoration: BoxDecoration(
                color: AppColors.colorPrimaryLighter,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(
                Icons.mosque,
                color: AppColors.colorWhiteHighEmp,
                size: 50.sp,
              ),
            ),
          SizedBox(height: 16.h),
          Text(
            widget.masjid.address,
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.colorWhiteHighEmp,
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Icon(
                Icons.location_on,
                color: AppColors.colorDonationGradient1End,
                size: 16.sp,
              ),
              SizedBox(width: 4.w),
              Text(
                '${widget.masjid.latitude.toStringAsFixed(6)}, ${widget.masjid.longitude.toStringAsFixed(6)}',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.colorWhiteMedEmp,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Consumer<MasjidProvider>(
            builder: (context, provider, child) {
              final isSelected =
                  provider.selectedMasjid?.id == widget.masjid.id;

              return ElevatedButton.icon(
                onPressed: () {
                  if (isSelected) {
                    provider.clearSelectedMasjid();
                  } else {
                    provider.setSelectedMasjid(widget.masjid);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isSelected
                      ? AppColors.colorDonationGradient1End
                      : AppColors.colorPrimaryLighter,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                icon: Icon(
                  isSelected ? Icons.star : Icons.star_border,
                  color: AppColors.colorWhiteHighEmp,
                ),
                label: Text(
                  isSelected ? 'Remove from Home' : 'Add to Home',
                  style: TextStyle(
                    color: AppColors.colorWhiteHighEmp,
                    fontSize: 14.sp,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPrayerTimesTab() {
    return Consumer<MasjidProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.colorWhiteHighEmp,
            ),
          );
        }

        if (provider.error.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Error: ${provider.error}',
                  style: TextStyle(
                    color: AppColors.colorWhiteHighEmp,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 16.h),
                ElevatedButton(
                  onPressed: _loadPrayerTimes,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.colorDonationGradient1End,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  child: Text(
                    'Retry',
                    style: TextStyle(
                      color: AppColors.colorWhiteHighEmp,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        final prayerTimes = provider.prayerTimes[widget.masjid.id ?? -1] ?? [];

        if (prayerTimes.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'No prayer times available',
                  style: TextStyle(
                    color: AppColors.colorWhiteHighEmp,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 16.h),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to add prayer time or scan timetable
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ScanTimetableScreen(masjid: widget.masjid),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.colorDonationGradient1End,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  child: Text(
                    'Scan Timetable',
                    style: TextStyle(
                      color: AppColors.colorWhiteHighEmp,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        // Sort prayer times by date
        prayerTimes.sort((a, b) => a.date.compareTo(b.date));

        return ListView.builder(
          padding: EdgeInsets.all(16.r),
          itemCount: prayerTimes.length,
          itemBuilder: (context, index) {
            final prayerTime = prayerTimes[index];
            return _buildPrayerTimeCard(prayerTime);
          },
        );
      },
    );
  }

  Widget _buildPrayerTimeCard(PrayerTimeModel prayerTime) {
    // Parse the date
    final date = DateTime.parse(prayerTime.date);
    final formattedDate = _displayDateFormat.format(date);

    return Card(
      margin: EdgeInsets.only(bottom: 16.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      color: AppColors.colorPrimaryDarker.withOpacity(0.8),
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              formattedDate,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.colorWhiteHighEmp,
              ),
            ),
            SizedBox(height: 8.h),
            Divider(color: AppColors.colorWhiteLowEmp),
            SizedBox(height: 8.h),
            _buildPrayerTimeRow('Fajr', prayerTime.getPrayerTime('fajr'),
                prayerTime.getJamaatTime('fajr')),
            _buildPrayerTimeRow('Dhuhr', prayerTime.getPrayerTime('dhuhr'),
                prayerTime.getJamaatTime('dhuhr')),
            _buildPrayerTimeRow('Asr', prayerTime.getPrayerTime('asr'),
                prayerTime.getJamaatTime('asr')),
            _buildPrayerTimeRow('Maghrib', prayerTime.getPrayerTime('maghrib'),
                prayerTime.getJamaatTime('maghrib')),
            _buildPrayerTimeRow('Isha', prayerTime.getPrayerTime('isha'),
                prayerTime.getJamaatTime('isha')),
            if (prayerTime.prayerData.containsKey('jummah') &&
                prayerTime.prayerData['jummah'] != null)
              _buildPrayerTimeRow(
                  'Jummah', prayerTime.getPrayerTime('jummah'), null,
                  isJummah: true),
            SizedBox(height: 8.h),
            if (prayerTime.source != 'manual')
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Source: ${prayerTime.source}',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontStyle: FontStyle.italic,
                    color: AppColors.colorWhiteLowEmp,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildPrayerTimeRow(String name, String time, String? jamaatTime,
      {bool isJummah = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          Container(
            width: 80.w,
            child: Text(
              name,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: isJummah ? FontWeight.bold : FontWeight.normal,
                color: isJummah
                    ? AppColors.colorDonationGradient1End
                    : AppColors.colorWhiteHighEmp,
              ),
            ),
          ),
          Expanded(
            child: Text(
              time,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.colorWhiteHighEmp,
              ),
            ),
          ),
          if (jamaatTime != null && jamaatTime != 'N/A')
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: AppColors.colorPrimaryLighter,
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Text(
                'Jamaat: $jamaatTime',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.colorWhiteHighEmp,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildInformationTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            color: AppColors.colorPrimaryDarker.withOpacity(0.8),
            child: Padding(
              padding: EdgeInsets.all(16.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contact Information',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.colorWhiteHighEmp,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Divider(color: AppColors.colorWhiteLowEmp),
                  SizedBox(height: 8.h),
                  if (widget.masjid.contactInfo != null &&
                      widget.masjid.contactInfo!.isNotEmpty)
                    ...widget.masjid.contactInfo!.entries
                        .map(
                          (entry) => Padding(
                            padding: EdgeInsets.symmetric(vertical: 4.h),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 100.w,
                                  child: Text(
                                    _capitalizeFirstLetter(entry.key),
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: AppColors.colorWhiteMedEmp,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    entry.value.toString(),
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: AppColors.colorWhiteHighEmp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList()
                  else
                    Text(
                      'No contact information available',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.colorWhiteMedEmp,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            color: AppColors.colorPrimaryDarker.withOpacity(0.8),
            child: Padding(
              padding: EdgeInsets.all(16.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Location',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.colorWhiteHighEmp,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Divider(color: AppColors.colorWhiteLowEmp),
                  SizedBox(height: 8.h),
                  Text(
                    widget.masjid.address,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.colorWhiteHighEmp,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Text(
                        'Coordinates: ',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.colorWhiteMedEmp,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '${widget.masjid.latitude.toStringAsFixed(6)}, ${widget.masjid.longitude.toStringAsFixed(6)}',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.colorWhiteHighEmp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Open in maps app
                      // Implementation will be added later
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.colorDonationGradient1End,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      minimumSize: Size(double.infinity, 48.h),
                    ),
                    icon: Icon(
                      Icons.map,
                      color: AppColors.colorWhiteHighEmp,
                    ),
                    label: Text(
                      'Open in Maps',
                      style: TextStyle(
                        color: AppColors.colorWhiteHighEmp,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _capitalizeFirstLetter(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }
}
