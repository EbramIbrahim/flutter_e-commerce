import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/styling/app_colors.dart';
import 'package:e_commerce/core/styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchCardItem extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String productPrice;

  const SearchCardItem({
    super.key,
    required this.imageUrl,
    required this.productName,
    required this.productPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: AppColors.white,
      child: SizedBox(
        height: 224.h,
        width: 161.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              width: double.infinity,
              height: 174.h,
              imageUrl: imageUrl,
              errorWidget: (context, url, error) {
                return Icon(Icons.error, color: Colors.red);
              },
            ),
            SizedBox(height: 8),
            Text(
              productName,
              style: AppStyles.black16W500TextStyle,
              maxLines: 1,
            ),
            SizedBox(height: 3),
            Text(
              productPrice,
              style: AppStyles.gray12MediumTextStyle.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
