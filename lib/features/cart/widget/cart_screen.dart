import 'package:e_commerce/core/styling/app_colors.dart';
import 'package:e_commerce/core/styling/app_styles.dart';
import 'package:e_commerce/core/widget/primary_button_widget.dart';
import 'package:e_commerce/features/cart/model/product.dart';
import 'package:e_commerce/features/cart/widget/product_cart_details_widget.dart';
import 'package:e_commerce/features/cart/widget/total_price_widget.dart';
import 'package:e_commerce/features/home/model/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          backgroundColor: AppColors.white,
          title: Text("My Cart", style: AppStyles.titleTextStyle),
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

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: ListView(
                    children: [
                      ProductCartDetailsWidget(
                        product: Products(
                          image:
                              "https://chriscross.in/cdn/shop/files/ChrisCrossNavyBlueCottonT-Shirt.jpg?v=1740994598",
                          title: "Regular Fit Slogan",
                          price: 10.312,
                        ),
                      ),
                      ProductCartDetailsWidget(
                        product: Products(
                          image:
                              "https://chriscross.in/cdn/shop/files/ChrisCrossNavyBlueCottonT-Shirt.jpg?v=1740994598",
                          title: "Regular Fit Slogan",
                          price: 10.312,
                        ),
                      ),
                      ProductCartDetailsWidget(
                        product: Products(
                          image:
                              "https://chriscross.in/cdn/shop/files/ChrisCrossNavyBlueCottonT-Shirt.jpg?v=1740994598",
                          title: "Regular Fit Slogan",
                          price: 10.312,
                        ),
                      ),
                      ProductCartDetailsWidget(
                        product: Products(
                          image:
                              "https://chriscross.in/cdn/shop/files/ChrisCrossNavyBlueCottonT-Shirt.jpg?v=1740994598",
                          title: "Regular Fit Slogan",
                          price: 10.312,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 50),
                TotalPriceWidget(),
                const SizedBox(height: 51),
                PrimaryButtonWidget(
                  buttonText: "Go To Checkout",
                  width: 341.w,
                  onPress: () {},
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
