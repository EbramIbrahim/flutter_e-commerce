import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/styling/app_colors.dart';
import 'package:e_commerce/core/styling/app_styles.dart';
import 'package:e_commerce/features/cart/model/product.dart';
import 'package:e_commerce/features/cart/widget/change_product_amount_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCartDetailsWidget extends StatelessWidget {
  final Product product;
  const ProductCartDetailsWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 14),
      width: 342.w,
      height: 127.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(
          width: 1,
          color: AppColors.grayColor.withValues(alpha: 0.3),
        ),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: product.productImage,
              width: 83.w,
              height: 79.h,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.productName,
                        style: AppStyles.titleTextStyle.copyWith(
                          fontSize: 14.sp,
                        ),
                      ),
                      IconButton(
                        alignment: Alignment.center,
                        onPressed: () {},
                        icon: Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                          size: 22.sp,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 1),
                  Text(
                    "Size ${product.productSize}",
                    style: AppStyles.gray12MediumTextStyle.copyWith(
                      fontSize: 14.sp,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.productPrice,
                        style: AppStyles.titleTextStyle.copyWith(
                          fontSize: 14.sp,
                        ),
                      ),
                      ChangeProductAmountWidget(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
