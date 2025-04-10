import 'package:e_commerce/core/styling/app_assets.dart';
import 'package:e_commerce/core/styling/app_colors.dart';
import 'package:e_commerce/core/styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressCardWidget extends StatelessWidget {
  const AddressCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 39),
      width: 341.w,
      height: 106.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(
          width: 1,
          color: AppColors.grayColor.withValues(alpha: 0.3),
        ),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          Image.asset(AppAssets.location),
          SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Office",
                style: AppStyles.titleTextStyle.copyWith(fontSize: 14.sp),
              ),
              SizedBox(
                width: 225.w,
                child: Text(
                  "925 S Chugach St #APT 10, Alas...",
                  style: AppStyles.gray12MediumTextStyle.copyWith(
                    fontSize: 14.sp,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
