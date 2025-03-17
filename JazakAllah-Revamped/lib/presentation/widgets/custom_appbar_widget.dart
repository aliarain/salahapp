import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../constants/fonts_weights.dart';

class CustomAppbarWidget extends StatelessWidget {
  final String screenTitle;
  final List<Widget>? actions;
  final bool showBackButton;

  const CustomAppbarWidget({
    Key? key,
    required this.screenTitle,
    this.actions,
    this.showBackButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      decoration: BoxDecoration(
        color: AppColors.colorPrimaryDarker.withOpacity(0.8),
      ),
      child: SafeArea(
        child: Row(
          children: [
            if (showBackButton)
              IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.colorWhiteHighEmp,
                  size: 20.sp,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            Expanded(
              child: Text(
                screenTitle,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.colorWhiteHighEmp,
                ),
                textAlign: showBackButton ? TextAlign.left : TextAlign.center,
              ),
            ),
            if (actions != null) ...actions!,
          ],
        ),
      ),
    );
  }
}
