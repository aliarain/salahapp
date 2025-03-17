import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import '../../../constants/colors.dart';
import '../../../constants/images.dart';
import '../../../data/viewmodel/Providers/masjid_provider.dart';
import '../../../data/viewmodel/Providers/location_provider.dart';
import '../../widgets/app_background_image_widget.dart';
import '../../widgets/custom_appbar_widget.dart';
import 'masjid_detail_screen.dart';

class NearbyMasjidsScreen extends StatefulWidget {
  const NearbyMasjidsScreen({Key? key}) : super(key: key);

  @override
  _NearbyMasjidsScreenState createState() => _NearbyMasjidsScreenState();
}

class _NearbyMasjidsScreenState extends State<NearbyMasjidsScreen> {
  double _radius = 10.0; // Default radius in miles

  @override
  void initState() {
    super.initState();
    _loadNearbyMasjids();
  }

  Future<void> _loadNearbyMasjids() async {
    final locationProvider =
        Provider.of<LocationProvider>(context, listen: false);
    final masjidProvider = Provider.of<MasjidProvider>(context, listen: false);

    try {
      // First ensure we have location
      if (locationProvider.latitude == null ||
          locationProvider.longitude == null) {
        await locationProvider.getCurrentLocation();
      }

      // Now check if we have location after trying to get it
      if (locationProvider.latitude == null ||
          locationProvider.longitude == null) {
        // Show manual location input dialog or handle error
        return;
      }

      // Load nearby masjids using the coordinates
      await masjidProvider.getNearbyMasjids(
        locationProvider.latitude!,
        locationProvider.longitude!,
        radius: _radius,
      );
    } catch (e) {
      print('Error loading nearby masjids: $e');
    }
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
            screenTitle: 'nearby_masjids'.tr,
          ),
          Padding(
            padding: EdgeInsets.only(top: 70.h),
            child: Column(
              children: [
                // Radius Slider
                Container(
                  padding: EdgeInsets.all(16.r),
                  color: AppColors.colorPrimaryDarker.withOpacity(0.8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Search Radius: ${_radius.toStringAsFixed(1)} miles',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.colorWhiteHighEmp,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Text(
                            '1',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.colorWhiteMedEmp,
                            ),
                          ),
                          Expanded(
                            child: Slider(
                              value: _radius,
                              min: 1.0,
                              max: 50.0,
                              divisions: 49,
                              activeColor: AppColors.colorDonationGradient1End,
                              inactiveColor: AppColors.colorPrimaryLighter,
                              onChanged: (value) {
                                setState(() {
                                  _radius = value;
                                });
                              },
                              onChangeEnd: (value) {
                                _loadNearbyMasjids();
                              },
                            ),
                          ),
                          Text(
                            '50',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.colorWhiteMedEmp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Masjid List
                Expanded(
                  child: Consumer2<LocationProvider, MasjidProvider>(
                    builder:
                        (context, locationProvider, masjidProvider, child) {
                      if (locationProvider.isLoading ||
                          masjidProvider.isLoading) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: AppColors.colorWhiteHighEmp,
                          ),
                        );
                      }

                      if (locationProvider.error.isNotEmpty) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Location Error: ${locationProvider.error}',
                                style: TextStyle(
                                  color: AppColors.colorWhiteHighEmp,
                                  fontSize: 16.sp,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 16.h),
                              ElevatedButton(
                                onPressed: _loadNearbyMasjids,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      AppColors.colorDonationGradient1End,
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

                      if (masjidProvider.error.isNotEmpty) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Error: ${masjidProvider.error}',
                                style: TextStyle(
                                  color: AppColors.colorWhiteHighEmp,
                                  fontSize: 16.sp,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 16.h),
                              ElevatedButton(
                                onPressed: _loadNearbyMasjids,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      AppColors.colorDonationGradient1End,
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

                      if (masjidProvider.nearbyMasjids.isEmpty) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'No masjids found within $_radius miles',
                                style: TextStyle(
                                  color: AppColors.colorWhiteHighEmp,
                                  fontSize: 16.sp,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 16.h),
                              Text(
                                'Try increasing the search radius',
                                style: TextStyle(
                                  color: AppColors.colorWhiteMedEmp,
                                  fontSize: 14.sp,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        );
                      }

                      return ListView.builder(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 8.h),
                        itemCount: masjidProvider.nearbyMasjids.length,
                        itemBuilder: (context, index) {
                          final masjid = masjidProvider.nearbyMasjids[index];
                          return Card(
                            margin: EdgeInsets.symmetric(vertical: 8.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            color:
                                AppColors.colorPrimaryDarker.withOpacity(0.8),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        MasjidDetailScreen(masjid: masjid),
                                  ),
                                );
                              },
                              borderRadius: BorderRadius.circular(12.r),
                              child: Padding(
                                padding: EdgeInsets.all(16.r),
                                child: Row(
                                  children: [
                                    if (masjid.image != null)
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        child: Image.network(
                                          masjid.image!,
                                          width: 60.w,
                                          height: 60.h,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) =>
                                                  Container(
                                            width: 60.w,
                                            height: 60.h,
                                            decoration: BoxDecoration(
                                              color:
                                                  AppColors.colorPrimaryLighter,
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                            ),
                                            child: Icon(
                                              Icons.mosque,
                                              color:
                                                  AppColors.colorWhiteHighEmp,
                                              size: 30.sp,
                                            ),
                                          ),
                                        ),
                                      )
                                    else
                                      Container(
                                        width: 60.w,
                                        height: 60.h,
                                        decoration: BoxDecoration(
                                          color: AppColors.colorPrimaryLighter,
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                        ),
                                        child: Icon(
                                          Icons.mosque,
                                          color: AppColors.colorWhiteHighEmp,
                                          size: 30.sp,
                                        ),
                                      ),
                                    SizedBox(width: 16.w),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            masjid.name,
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  AppColors.colorWhiteHighEmp,
                                            ),
                                          ),
                                          SizedBox(height: 4.h),
                                          Text(
                                            masjid.address,
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              color: AppColors.colorWhiteMedEmp,
                                            ),
                                          ),
                                          if (masjid.distance != null)
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 4.h),
                                              child: Text(
                                                '${masjid.distance!.toStringAsFixed(1)} miles away',
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: AppColors
                                                      .colorDonationGradient1End,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                    Icon(
                                      Icons.chevron_right,
                                      color: AppColors.colorWhiteHighEmp,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
