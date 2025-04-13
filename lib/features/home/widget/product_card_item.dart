import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/routing/app_router.dart';
import 'package:e_commerce/core/styling/app_colors.dart';
import 'package:e_commerce/core/styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProductCardItem extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String productPrice;
  final int? id;

  const ProductCardItem({
    super.key,
    required this.imageUrl,
    required this.productName,
    required this.productPrice,
    this.id,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).pushNamed(AppRouter.detailsScreen, extra: id);
      },
      child: Card(
        elevation: 4,
        color: AppColors.white,
        child: SizedBox(
          height: 224.h,
          width: 161.w,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
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
        ),
      ),
    );
  }
}
