import 'dart:io';
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

class TimetableResultsScreen extends StatefulWidget {
  final File image;
  final Map<String, dynamic> results;
  final MasjidModel? masjid;

  const TimetableResultsScreen({
    Key? key,
    required this.image,
    required this.results,
    this.masjid,
  }) : super(key: key);

  @override
  _TimetableResultsScreenState createState() => _TimetableResultsScreenState();
}

class _TimetableResultsScreenState extends State<TimetableResultsScreen> {
  final _formKey = GlobalKey<FormState>();
  late DateTime _selectedDate;
  late Map<String, TextEditingController> _controllers;
  bool _isLoading = false;
  String _error = '';

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _initializeControllers();
  }

  void _initializeControllers() {
    _controllers = {
      'fajr': TextEditingController(text: _getTimeFromResults('fajr')),
      'dhuhr': TextEditingController(text: _getTimeFromResults('dhuhr')),
      'asr': TextEditingController(text: _getTimeFromResults('asr')),
      'maghrib': TextEditingController(text: _getTimeFromResults('maghrib')),
      'isha': TextEditingController(text: _getTimeFromResults('isha')),
      'jummah': TextEditingController(text: _getTimeFromResults('jummah')),
    };
  }

  String _getTimeFromResults(String prayer) {
    // Handle different possible formats from the AI
    if (widget.results.containsKey(prayer)) {
      return widget.results[prayer].toString();
    } else if (widget.results.containsKey('prayer_times') &&
        widget.results['prayer_times'] is Map &&
        widget.results['prayer_times'].containsKey(prayer)) {
      return widget.results['prayer_times'][prayer].toString();
    } else if (widget.results.containsKey('times') &&
        widget.results['times'] is Map &&
        widget.results['times'].containsKey(prayer)) {
      return widget.results['times'][prayer].toString();
    }
    return '';
  }

  @override
  void dispose() {
    _controllers.forEach((_, controller) => controller.dispose());
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now().subtract(const Duration(days: 30)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.dark(
              primary: AppColors.colorDonationGradient1End,
              onPrimary: AppColors.colorWhiteHighEmp,
              surface: AppColors.colorPrimaryDarker,
              onSurface: AppColors.colorWhiteHighEmp,
            ),
            dialogBackgroundColor: AppColors.colorPrimaryDarker,
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _savePrayerTimes() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
      _error = '';
    });

    try {
      final masjidProvider =
          Provider.of<MasjidProvider>(context, listen: false);

      // Get the masjid - either from widget parameter or from provider
      final selectedMasjid = widget.masjid ?? masjidProvider.selectedMasjid;

      if (selectedMasjid == null) {
        setState(() {
          _error = 'No masjid selected. Please select a masjid first.';
          _isLoading = false;
        });
        return;
      }

      // Create prayer data map
      final Map<String, dynamic> prayerData = {};
      _controllers.forEach((prayer, controller) {
        if (controller.text.isNotEmpty) {
          prayerData[prayer] = controller.text;
        }
      });

      // Create prayer time model
      final prayerTime = PrayerTimeModel(
        masjidId: selectedMasjid.id!,
        date: DateFormat('yyyy-MM-dd').format(_selectedDate),
        prayerData: prayerData,
        source: 'scan',
        timetableImage:
            null, // We could upload the image to server and store URL
      );

      // Save prayer times
      final result = await masjidProvider.addPrayerTimes(prayerTime);

      setState(() {
        _isLoading = false;
      });

      if (result != null) {
        Get.back();
        Get.back();
        Get.snackbar(
          'Success',
          'Prayer times saved successfully',
          backgroundColor: AppColors.colorPrimaryDarker,
          colorText: AppColors.colorWhiteHighEmp,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        setState(() {
          _error = 'Failed to save prayer times: ${masjidProvider.error}';
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
        _error = 'Error saving prayer times: $e';
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
            screenTitle: 'Extracted Prayer Times',
          ),
          Padding(
            padding: EdgeInsets.only(top: 70.h),
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.r),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                                    'Saving to:',
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

                    // Image preview
                    Container(
                      height: 200.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: AppColors.colorWhiteLowEmp,
                          width: 1,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Image.file(
                          widget.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),

                    // Date selection
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Date: ${DateFormat('EEEE, MMMM d, yyyy').format(_selectedDate)}',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: AppColors.colorWhiteHighEmp,
                            ),
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () => _selectDate(context),
                          icon: Icon(
                            Icons.calendar_today,
                            color: AppColors.colorDonationGradient1End,
                            size: 16.sp,
                          ),
                          label: Text(
                            'Change',
                            style: TextStyle(
                              color: AppColors.colorDonationGradient1End,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),

                    // Prayer times form
                    Text(
                      'Extracted Prayer Times',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.colorWhiteHighEmp,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Review and edit the extracted times if needed',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.colorWhiteMedEmp,
                      ),
                    ),
                    SizedBox(height: 16.h),

                    // Prayer time fields
                    _buildPrayerTimeField('Fajr', _controllers['fajr']!),
                    SizedBox(height: 12.h),
                    _buildPrayerTimeField('Dhuhr', _controllers['dhuhr']!),
                    SizedBox(height: 12.h),
                    _buildPrayerTimeField('Asr', _controllers['asr']!),
                    SizedBox(height: 12.h),
                    _buildPrayerTimeField('Maghrib', _controllers['maghrib']!),
                    SizedBox(height: 12.h),
                    _buildPrayerTimeField('Isha', _controllers['isha']!),
                    SizedBox(height: 12.h),
                    _buildPrayerTimeField('Jummah', _controllers['jummah']!,
                        isRequired: false),

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

                    // Save button
                    Consumer<MasjidProvider>(
                      builder: (context, provider, child) {
                        return ElevatedButton(
                          onPressed: _isLoading ? null : _savePrayerTimes,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                AppColors.colorDonationGradient1End,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            minimumSize: Size(double.infinity, 48.h),
                            disabledBackgroundColor: AppColors
                                .colorDonationGradient1End
                                .withOpacity(0.5),
                          ),
                          child: _isLoading
                              ? SizedBox(
                                  height: 24.h,
                                  width: 24.w,
                                  child: CircularProgressIndicator(
                                    color: AppColors.colorWhiteHighEmp,
                                    strokeWidth: 3,
                                  ),
                                )
                              : Text(
                                  'Save Prayer Times',
                                  style: TextStyle(
                                    color: AppColors.colorWhiteHighEmp,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrayerTimeField(String label, TextEditingController controller,
      {bool isRequired = true}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: AppColors.colorWhiteHighEmp,
          fontSize: 16.sp,
        ),
        filled: true,
        fillColor: AppColors.colorPrimaryDarker.withOpacity(0.8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: AppColors.colorWhiteLowEmp,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: AppColors.colorDonationGradient1End,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),
        suffixIcon: Icon(
          Icons.access_time,
          color: AppColors.colorWhiteHighEmp,
        ),
      ),
      style: TextStyle(
        color: AppColors.colorWhiteHighEmp,
        fontSize: 16.sp,
      ),
      validator: (value) {
        if (isRequired && (value == null || value.isEmpty)) {
          return 'Please enter $label time';
        }

        // Validate time format (HH:MM or H:MM)
        if (value != null && value.isNotEmpty) {
          final timeRegex = RegExp(r'^([0-1]?[0-9]|2[0-3]):[0-5][0-9]$');
          if (!timeRegex.hasMatch(value)) {
            return 'Enter valid time (HH:MM)';
          }
        }
        return null;
      },
    );
  }
}
