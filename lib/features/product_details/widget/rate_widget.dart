import 'package:e_commerce/core/styling/app_assets.dart';
import 'package:e_commerce/core/styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RateWidget extends StatelessWidget {
  final String rate;
  final String reviews;
  const RateWidget({super.key, required this.rate, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 168.w,
      height: 22.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(AppAssets.start),
          SizedBox(width: 2),
          Text(
            "$rate/5",
            style: AppStyles.black16W500TextStyle.copyWith(
              textBaseline: TextBaseline.alphabetic,
            ),
          ),
          Text(
            "($reviews reviews)",
            style: AppStyles.gray12MediumTextStyle.copyWith(fontSize: 16.sp),
          ),
        ],
      ),
    );
  }
}
