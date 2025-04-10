import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/styling/app_colors.dart';
import 'package:e_commerce/core/styling/app_styles.dart';
import 'package:e_commerce/features/product_details/widget/add_card_widget.dart';
import 'package:e_commerce/features/product_details/widget/rate_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProduceDetailsScreen extends StatelessWidget {
  const ProduceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          backgroundColor: AppColors.white,
          title: Text("Details", style: AppStyles.titleTextStyle),
          centerTitle: true,
          leading: Icon(
            Icons.arrow_back,
            size: 24.sp,
            color: AppColors.blackColor,
          ),
        ),

        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                CachedNetworkImage(
                  imageUrl:
                      "https://chriscross.in/cdn/shop/files/ChrisCrossNavyBlueCottonT-Shirt.jpg?v=1740994598",
                  width: double.infinity,
                  height: 368.h,
                ),
                const SizedBox(height: 12),
                Text("Fit Polo T Shirt", style: AppStyles.black16W500TextStyle),
                const SizedBox(height: 12),
                RateWidget(rate: "4.5", reviews: "45"),
                const SizedBox(height: 12),
                Text(
                  "Blue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of Them",
                  style: AppStyles.gray12MediumTextStyle.copyWith(
                    fontSize: 16.sp,
                  ),
                ),
                const SizedBox(height: 107),
                AddCardWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
