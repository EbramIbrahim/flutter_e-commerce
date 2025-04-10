import 'package:e_commerce/core/styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TypeOfPaymentsText extends StatelessWidget {
  final String paymentText;
  final String paymentPriceText;
  const TypeOfPaymentsText({
    super.key,
    required this.paymentText,
    required this.paymentPriceText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          paymentText,
          style: AppStyles.gray12MediumTextStyle.copyWith(fontSize: 16.sp),
        ),
        Text(paymentPriceText, style: AppStyles.black16W500TextStyle),
      ],
    );
  }
}
