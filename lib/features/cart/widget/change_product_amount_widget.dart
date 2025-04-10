import 'package:e_commerce/core/styling/app_colors.dart';
import 'package:e_commerce/core/styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangeProductAmountWidget extends StatelessWidget {
  const ChangeProductAmountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    int counter = 0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 23.sp,
          height: 23.sp,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: AppColors.grayColor),
            borderRadius: BorderRadius.circular(3.r),
          ),
          alignment: Alignment.center,
          child: Icon(Icons.remove, size: 14.sp, color: AppColors.blackColor),
        ),
        const SizedBox(width: 3),
        Text(
          "$counter",
          style: AppStyles.black16W500TextStyle.copyWith(fontSize: 14.sp),
        ),
        const SizedBox(width: 3),

        Container(
          width: 23.sp,
          height: 23.sp,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: AppColors.grayColor),
            borderRadius: BorderRadius.circular(3.r),
          ),
          alignment: Alignment.center,
          child: Icon(Icons.add, size: 14.sp, color: AppColors.blackColor),
        ),
      ],
    );
  }
}
