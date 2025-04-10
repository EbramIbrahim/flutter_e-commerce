import 'package:e_commerce/core/styling/app_styles.dart';
import 'package:e_commerce/core/widget/primary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCardWidget extends StatelessWidget {
  const AddCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(thickness: 1),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 26),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Price",
                  style: AppStyles.gray12MediumTextStyle.copyWith(
                    fontSize: 16.sp,
                  ),
                ),
                Text(
                  "1,190",
                  style: AppStyles.black16W500TextStyle.copyWith(
                    fontSize: 24.sp,
                  ),
                ),
              ],
            ),
            SizedBox(width: 16),
            PrimaryButtonWidget(
              buttonText: "Add To Cart",
              width: 240.w,
              height: 54.h,
              onPress: () {},
            ),
          ],
        ),
        SizedBox(height: 32),
      ],
    );
  }
}
