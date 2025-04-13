import 'package:e_commerce/core/styling/app_colors.dart';
import 'package:e_commerce/core/styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchCategoryItem extends StatelessWidget {
  final String? title;
  final bool isPressed;
  final VoidCallback? onPressed;
  const CustomSearchCategoryItem({
    super.key,
    this.title,
    this.isPressed = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 8),
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor:
              isPressed ? AppColors.primaryColor : Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        ),
        child: Text(
          title ?? "",
          style: AppStyles.black16W500TextStyle.copyWith(
            fontSize: 14.sp,
            color: isPressed ? AppColors.white : AppColors.blackColor,
          ),
        ),
      ),
    );
  }
}
