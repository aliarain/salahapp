import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../constants/colors.dart';
import '../../../constants/images.dart';
import '../../../data/models/masjid_model.dart';
import '../../../data/viewmodel/Providers/masjid_provider.dart';
import '../../../data/viewmodel/Providers/location_provider.dart';
import '../../widgets/app_background_image_widget.dart';
import '../../widgets/custom_appbar_widget.dart';
import 'scan_timetable_screen.dart';

class AddMasjidScreen extends StatefulWidget {
  final bool fromTimetable;
  final MasjidModel? masjid;

  const AddMasjidScreen({Key? key, this.fromTimetable = false, this.masjid})
      : super(key: key);

  @override
  _AddMasjidScreenState createState() => _AddMasjidScreenState();
}

class _AddMasjidScreenState extends State<AddMasjidScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _latitudeController = TextEditingController();
  final _longitudeController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _websiteController = TextEditingController();

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    final locationProvider =
        Provider.of<LocationProvider>(context, listen: false);

    try {
      await locationProvider.getCurrentLocation();

      if (locationProvider.latitude != null &&
          locationProvider.longitude != null) {
        setState(() {
          _latitudeController.text = locationProvider.latitude!.toString();
          _longitudeController.text = locationProvider.longitude!.toString();
        });
      }
    } catch (e) {
      // Handle error
      print('Error getting current location: $e');
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _latitudeController.dispose();
    _longitudeController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _websiteController.dispose();
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
            screenTitle: 'Add Masjid',
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
                    Text(
                      'Masjid Information',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.colorWhiteHighEmp,
                      ),
                    ),
                    SizedBox(height: 16.h),

                    // Name
                    _buildTextField(
                      controller: _nameController,
                      labelText: 'Masjid Name',
                      hintText: 'Enter masjid name',
                      icon: Icons.mosque,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter masjid name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.h),

                    // Address
                    _buildTextField(
                      controller: _addressController,
                      labelText: 'Address',
                      hintText: 'Enter masjid address',
                      icon: Icons.location_on,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter masjid address';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.h),

                    // Coordinates
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField(
                            controller: _latitudeController,
                            labelText: 'Latitude',
                            hintText: 'Latitude',
                            icon: Icons.my_location,
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Required';
                              }
                              if (double.tryParse(value) == null) {
                                return 'Invalid';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: _buildTextField(
                            controller: _longitudeController,
                            labelText: 'Longitude',
                            hintText: 'Longitude',
                            icon: Icons.my_location,
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Required';
                              }
                              if (double.tryParse(value) == null) {
                                return 'Invalid';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),

                    // Get current location button
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton.icon(
                        onPressed: _getCurrentLocation,
                        icon: Icon(
                          Icons.my_location,
                          color: AppColors.colorDonationGradient1End,
                          size: 16.sp,
                        ),
                        label: Text(
                          'Use Current Location',
                          style: TextStyle(
                            color: AppColors.colorDonationGradient1End,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),

                    Text(
                      'Contact Information (Optional)',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.colorWhiteHighEmp,
                      ),
                    ),
                    SizedBox(height: 16.h),

                    // Phone
                    _buildTextField(
                      controller: _phoneController,
                      labelText: 'Phone Number',
                      hintText: 'Enter phone number',
                      icon: Icons.phone,
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(height: 16.h),

                    // Email
                    _buildTextField(
                      controller: _emailController,
                      labelText: 'Email',
                      hintText: 'Enter email address',
                      icon: Icons.email,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 16.h),

                    // Website
                    _buildTextField(
                      controller: _websiteController,
                      labelText: 'Website',
                      hintText: 'Enter website URL',
                      icon: Icons.web,
                      keyboardType: TextInputType.url,
                    ),
                    SizedBox(height: 32.h),

                    // Submit Button
                    Consumer<MasjidProvider>(
                      builder: (context, provider, child) {
                        return ElevatedButton(
                          onPressed: provider.isLoading || _isLoading
                              ? null
                              : () => _submitForm(provider),
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
                          child: provider.isLoading || _isLoading
                              ? CircularProgressIndicator(
                                  color: AppColors.colorWhiteHighEmp,
                                  strokeWidth: 3,
                                )
                              : Text(
                                  'Add Masjid',
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required String hintText,
    required IconData icon,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        labelStyle: TextStyle(
          color: AppColors.colorWhiteHighEmp,
          fontSize: 16.sp,
        ),
        hintStyle: TextStyle(
          color: AppColors.colorWhiteLowEmp,
          fontSize: 14.sp,
        ),
        prefixIcon: Icon(
          icon,
          color: AppColors.colorWhiteHighEmp,
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
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
        errorStyle: TextStyle(
          color: Colors.red,
          fontSize: 12.sp,
        ),
      ),
      style: TextStyle(
        color: AppColors.colorWhiteHighEmp,
        fontSize: 16.sp,
      ),
      keyboardType: keyboardType,
      validator: validator,
    );
  }

  Future<void> _submitForm(MasjidProvider provider) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        // Create contact info map
        Map<String, dynamic> contactInfo = {};

        if (_phoneController.text.isNotEmpty) {
          contactInfo['phone'] = _phoneController.text;
        }

        if (_emailController.text.isNotEmpty) {
          contactInfo['email'] = _emailController.text;
        }

        if (_websiteController.text.isNotEmpty) {
          contactInfo['website'] = _websiteController.text;
        }

        // Create masjid model
        final masjid = MasjidModel(
          name: _nameController.text,
          address: _addressController.text,
          latitude: double.parse(_latitudeController.text),
          longitude: double.parse(_longitudeController.text),
          contactInfo: contactInfo.isNotEmpty ? contactInfo : null,
        );

        // Add masjid
        final newMasjid = await provider.addMasjid(masjid);

        if (newMasjid != null) {
          if (widget.fromTimetable) {
            // Return to timetable screen with the new masjid
            Navigator.pop(context, newMasjid);
          } else {
            // Show success dialog
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: AppColors.colorPrimaryDarker,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                title: Text(
                  'Success',
                  style: TextStyle(
                    color: AppColors.colorWhiteHighEmp,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                content: Text(
                  'Masjid has been successfully added.',
                  style: TextStyle(
                    color: AppColors.colorWhiteHighEmp,
                    fontSize: 16.sp,
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context); // Return to previous screen
                    },
                    child: Text(
                      'OK',
                      style: TextStyle(
                        color: AppColors.colorDonationGradient1End,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        } else {
          // Show error dialog
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: AppColors.colorPrimaryDarker,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              title: Text(
                'Error',
                style: TextStyle(
                  color: AppColors.colorWhiteHighEmp,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: Text(
                'Failed to add masjid. Please try again.\n\n${provider.error}',
                style: TextStyle(
                  color: AppColors.colorWhiteHighEmp,
                  fontSize: 16.sp,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'OK',
                    style: TextStyle(
                      color: AppColors.colorDonationGradient1End,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      } catch (e) {
        // Show error dialog
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: AppColors.colorPrimaryDarker,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            title: Text(
              'Error',
              style: TextStyle(
                color: AppColors.colorWhiteHighEmp,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Text(
              'Failed to add masjid. Please try again.\n\n$e',
              style: TextStyle(
                color: AppColors.colorWhiteHighEmp,
                fontSize: 16.sp,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'OK',
                  style: TextStyle(
                    color: AppColors.colorDonationGradient1End,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Widget _buildMasjidSelector() {
    return Consumer<MasjidProvider>(
      builder: (context, masjidProvider, child) {
        if (masjidProvider.isLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.colorDonationGradient1End,
            ),
          );
        }

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

              // Dropdown for masjid selection
              DropdownButtonFormField<MasjidModel?>(
                dropdownColor: AppColors.colorPrimaryDarker,
                value: widget.masjid,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.colorPrimaryDarker.withOpacity(0.5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(color: AppColors.colorWhiteLowEmp),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                ),
                style: TextStyle(
                  color: AppColors.colorWhiteHighEmp,
                  fontSize: 14.sp,
                ),
                hint: Text(
                  'Select a masjid',
                  style: TextStyle(
                    color: AppColors.colorWhiteMedEmp,
                    fontSize: 14.sp,
                  ),
                ),
                items: [
                  ...masjidProvider.masjids
                      .map((masjid) => DropdownMenuItem<MasjidModel?>(
                            value: masjid,
                            child: Text(
                              masjid.name,
                              style: TextStyle(
                                color: AppColors.colorWhiteHighEmp,
                              ),
                            ),
                          ))
                      .toList(),
                  // Add New Masjid option
                  DropdownMenuItem<MasjidModel?>(
                    value: null,
                    child: Row(
                      children: [
                        Icon(Icons.add_circle,
                            color: AppColors.colorDonationGradient1End,
                            size: 16.sp),
                        SizedBox(width: 8.w),
                        Text(
                          'Add New Masjid',
                          style: TextStyle(
                            color: AppColors.colorDonationGradient1End,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                onChanged: (value) {
                  if (value == null) {
                    // "Add New Masjid" option selected
                    _navigateToAddMasjid();
                  } else {
                    setState(() {
                      // No need to update widget.masjid here, as it's a final parameter
                    });
                  }
                },
              ),

              if (masjidProvider.error.isNotEmpty &&
                  masjidProvider.error.contains('masjid'))
                Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: Text(
                    masjidProvider.error,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  void _navigateToAddMasjid() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddMasjidScreen(fromTimetable: true),
      ),
    );

    // If a new masjid was created, set the state to refresh the selector
    if (result != null && result is MasjidModel) {
      setState(() {
        // No need to update widget.masjid here, as it's a final parameter
      });
    }
  }
}
