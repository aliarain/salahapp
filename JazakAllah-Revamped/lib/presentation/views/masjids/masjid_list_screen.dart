import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../constants/colors.dart';
import '../../../constants/images.dart';
import '../../../data/models/masjid_model.dart';
import '../../../data/viewmodel/Providers/masjid_provider.dart';
import '../../widgets/app_background_image_widget.dart';
import '../../widgets/custom_appbar_widget.dart';
import 'masjid_detail_screen.dart';
import 'nearby_masjids_screen.dart';

class MasjidListScreen extends StatefulWidget {
  const MasjidListScreen({Key? key}) : super(key: key);

  @override
  _MasjidListScreenState createState() => _MasjidListScreenState();
}

class _MasjidListScreenState extends State<MasjidListScreen> {
  @override
  void initState() {
    super.initState();
    // Load masjids when screen initializes
    Future.microtask(
        () => Provider.of<MasjidProvider>(context, listen: false).getMasjids());
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
            screenTitle: 'masjids'.tr,
            actions: [
              IconButton(
                icon: Icon(
                  Icons.location_on,
                  color: AppColors.colorWhiteHighEmp,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NearbyMasjidsScreen()),
                  );
                },
                tooltip: 'Find Nearby Masjids',
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 70.h),
            child: Consumer<MasjidProvider>(
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
                          onPressed: () => provider.getMasjids(),
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

                if (provider.masjids.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'No masjids found',
                          style: TextStyle(
                            color: AppColors.colorWhiteHighEmp,
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NearbyMasjidsScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                AppColors.colorDonationGradient1End,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          child: Text(
                            'Find Nearby Masjids',
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

                return RefreshIndicator(
                  onRefresh: () async {
                    await provider.getMasjids();
                  },
                  color: AppColors.colorDonationGradient1End,
                  child: ListView.builder(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    itemCount: provider.masjids.length,
                    itemBuilder: (context, index) {
                      final masjid = provider.masjids[index];
                      return MasjidListItem(
                        masjid: masjid,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  MasjidDetailScreen(masjid: masjid),
                            ),
                          );
                        },
                        onToggleSelection: () {
                          // Toggle masjid selection for home screen display
                          provider.setSelectedMasjid(masjid);
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to add masjid screen
          // Will be implemented later
        },
        backgroundColor: AppColors.colorDonationGradient1End,
        child: Icon(
          Icons.add,
          color: AppColors.colorWhiteHighEmp,
        ),
        tooltip: 'Add Masjid',
      ),
    );
  }
}

class MasjidListItem extends StatelessWidget {
  final MasjidModel masjid;
  final VoidCallback onTap;
  final VoidCallback onToggleSelection;

  const MasjidListItem({
    Key? key,
    required this.masjid,
    required this.onTap,
    required this.onToggleSelection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      color: AppColors.colorPrimaryDarker.withOpacity(0.8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Row(
            children: [
              if (masjid.image != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: Image.network(
                    masjid.image!,
                    width: 60.w,
                    height: 60.h,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: 60.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        color: AppColors.colorPrimaryLighter,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Icon(
                        Icons.mosque,
                        color: AppColors.colorWhiteHighEmp,
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
                    borderRadius: BorderRadius.circular(8.r),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      masjid.name,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.colorWhiteHighEmp,
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
                        padding: EdgeInsets.only(top: 4.h),
                        child: Text(
                          '${masjid.distance!.toStringAsFixed(1)} miles away',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.colorDonationGradient1End,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Checkbox(
                value:
                    Provider.of<MasjidProvider>(context).selectedMasjid?.id ==
                        masjid.id,
                onChanged: (_) => onToggleSelection(),
                activeColor: AppColors.colorDonationGradient1End,
                checkColor: AppColors.colorWhiteHighEmp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
