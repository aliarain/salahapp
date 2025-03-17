import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../constants/colors.dart';
import '../../../constants/images.dart';
import '../../../data/models/masjid_model.dart';
import '../../../data/services/deepseek_service.dart';
import '../../../data/viewmodel/Providers/masjid_provider.dart';
import '../../widgets/app_background_image_widget.dart';
import '../../widgets/custom_appbar_widget.dart';
import 'timetable_results_screen.dart';
import 'add_masjid_screen.dart';

class ScanTimetableScreen extends StatefulWidget {
  final MasjidModel? masjid; // Make this optional to support both use cases

  const ScanTimetableScreen({Key? key, this.masjid}) : super(key: key);

  @override
  _ScanTimetableScreenState createState() => _ScanTimetableScreenState();
}

class _ScanTimetableScreenState extends State<ScanTimetableScreen> {
  File? _selectedImage;
  bool _isProcessing = false;
  String _error = '';
  MasjidModel? _selectedMasjid;

  @override
  void initState() {
    super.initState();
    _selectedMasjid = widget.masjid;

    // Load masjids if not already loaded
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final masjidProvider =
          Provider.of<MasjidProvider>(context, listen: false);
      if (masjidProvider.masjids.isEmpty) {
        masjidProvider.getMasjids();
      }
    });
  }

  Future<void> _getImage(ImageSource source) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(
        source: source,
        imageQuality: 80,
      );

      if (pickedFile != null) {
        setState(() {
          _selectedImage = File(pickedFile.path);
          _error = '';
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Error selecting image: $e';
      });
    }
  }

  Future<void> _processImage() async {
    if (_selectedImage == null) {
      setState(() {
        _error = 'Please select an image first';
      });
      return;
    }

    // Check if a masjid is selected
    if (_selectedMasjid == null) {
      setState(() {
        _error = 'Please select a masjid first';
      });
      return;
    }

    setState(() {
      _isProcessing = true;
      _error = '';
    });

    try {
      final deepseekService = DeepseekService();
      final result = await deepseekService.scanTimetable(_selectedImage!);

      setState(() {
        _isProcessing = false;
      });

      if (result != null) {
        Get.to(() => TimetableResultsScreen(
              image: _selectedImage!,
              results: result,
              masjid: _selectedMasjid,
            ));
      } else {
        setState(() {
          _error = 'Failed to process the image. Please try again.';
        });
      }
    } catch (e) {
      setState(() {
        _isProcessing = false;
        _error = 'Error processing image: $e';
      });
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
            screenTitle: 'Scan Prayer Timetable',
          ),
          Padding(
            padding: EdgeInsets.only(top: 70.h),
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Add masjid selector if no masjid was passed
                  if (widget.masjid == null) _buildMasjidSelector(),

                  // Masjid info if available
                  if (widget.masjid != null)
                    Container(
                      padding: EdgeInsets.all(16.r),
                      margin: EdgeInsets.only(bottom: 16.h),
                      decoration: BoxDecoration(
                        color: AppColors.colorPrimaryDarker.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.mosque,
                            color: AppColors.colorDonationGradient1End,
                            size: 24.sp,
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Scanning for:',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: AppColors.colorWhiteMedEmp,
                                  ),
                                ),
                                Text(
                                  widget.masjid!.name,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.colorWhiteHighEmp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                  // Instructions
                  Container(
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                      color: AppColors.colorPrimaryDarker.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'How it works:',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.colorWhiteHighEmp,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        _buildInstructionItem(
                          '1',
                          'Take a clear photo of a prayer timetable or select from gallery',
                        ),
                        SizedBox(height: 8.h),
                        _buildInstructionItem(
                          '2',
                          'Our AI will extract prayer times automatically',
                        ),
                        SizedBox(height: 8.h),
                        _buildInstructionItem(
                          '3',
                          'Review and save the extracted times to your masjid',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),

                  // Image selection area
                  Container(
                    width: double.infinity,
                    height: 300.h,
                    decoration: BoxDecoration(
                      color: AppColors.colorPrimaryDarker.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: AppColors.colorWhiteLowEmp,
                        width: 1,
                      ),
                    ),
                    child: _selectedImage == null
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.image,
                                size: 80.sp,
                                color: AppColors.colorWhiteMedEmp,
                              ),
                              SizedBox(height: 16.h),
                              Text(
                                'No image selected',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColors.colorWhiteMedEmp,
                                ),
                              ),
                              SizedBox(height: 24.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _buildImageSourceButton(
                                    'Camera',
                                    Icons.camera_alt,
                                    () => _getImage(ImageSource.camera),
                                  ),
                                  SizedBox(width: 24.w),
                                  _buildImageSourceButton(
                                    'Gallery',
                                    Icons.photo_library,
                                    () => _getImage(ImageSource.gallery),
                                  ),
                                ],
                              ),
                            ],
                          )
                        : Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12.r),
                                child: Image.file(
                                  _selectedImage!,
                                  width: double.infinity,
                                  height: 300.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 8,
                                right: 8,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _selectedImage = null;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(8.r),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.7),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.close,
                                      color: AppColors.colorWhiteHighEmp,
                                      size: 20.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ),

                  // Error message
                  if (_error.isNotEmpty)
                    Padding(
                      padding: EdgeInsets.only(top: 16.h),
                      child: Text(
                        _error,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),

                  SizedBox(height: 24.h),

                  // Process button
                  ElevatedButton(
                    onPressed: _isProcessing || _selectedImage == null
                        ? null
                        : _processImage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.colorDonationGradient1End,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      minimumSize: Size(double.infinity, 48.h),
                      disabledBackgroundColor:
                          AppColors.colorDonationGradient1End.withOpacity(0.5),
                    ),
                    child: _isProcessing
                        ? SizedBox(
                            height: 24.h,
                            width: 24.w,
                            child: CircularProgressIndicator(
                              color: AppColors.colorWhiteHighEmp,
                              strokeWidth: 3,
                            ),
                          )
                        : Text(
                            'Process Timetable',
                            style: TextStyle(
                              color: AppColors.colorWhiteHighEmp,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
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

  Widget _buildInstructionItem(String number, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 24.w,
          height: 24.h,
          decoration: BoxDecoration(
            color: AppColors.colorDonationGradient1End,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              number,
              style: TextStyle(
                color: AppColors.colorWhiteHighEmp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.colorWhiteHighEmp,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildImageSourceButton(
      String label, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: AppColors.colorPrimaryLighter,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: AppColors.colorWhiteHighEmp,
              size: 24.sp,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.colorWhiteHighEmp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMasjidSelector() {
    final masjidProvider = Provider.of<MasjidProvider>(context);

    return Container(
      padding: EdgeInsets.all(16.r),
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: AppColors.colorPrimaryDarker.withOpacity(0.8),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select Masjid',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.colorWhiteHighEmp,
            ),
          ),
          SizedBox(height: 8.h),
          DropdownButtonFormField<MasjidModel?>(
            dropdownColor: AppColors.colorPrimaryDarker,
            value: _selectedMasjid,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.colorPrimaryDarker.withOpacity(0.5),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: AppColors.colorWhiteLowEmp),
              ),
            ),
            style: TextStyle(
              color: AppColors.colorWhiteHighEmp,
              fontSize: 14.sp,
            ),
            items: [
              ...masjidProvider.masjids
                  .map((masjid) => DropdownMenuItem<MasjidModel?>(
                        value: masjid,
                        child: Text(masjid.name),
                      ))
                  .toList(),
              // Add New Masjid option
              DropdownMenuItem<MasjidModel?>(
                value: null,
                child: Row(
                  children: [
                    Icon(Icons.add_circle,
                        color: AppColors.colorDonationGradient1End),
                    SizedBox(width: 8.w),
                    Text('Add New Masjid',
                        style: TextStyle(
                          color: AppColors.colorDonationGradient1End,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
            ],
            onChanged: (value) {
              setState(() {
                _selectedMasjid = value;
              });

              // If "Add New Masjid" is selected
              if (value == null) {
                _navigateToAddMasjid();
              }
            },
          ),
        ],
      ),
    );
  }

  void _navigateToAddMasjid() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddMasjidScreen(fromTimetable: true),
      ),
    );

    // If a new masjid was created, select it
    if (result != null && result is MasjidModel) {
      setState(() {
        _selectedMasjid = result;
      });
    }
  }
}
