import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/styling/app_colors.dart';
import 'package:e_commerce/core/styling/app_styles.dart';
import 'package:e_commerce/core/widget/loading_item.dart';
import 'package:e_commerce/features/home/model/products.dart';
import 'package:e_commerce/features/product_details/cubit/product_details_cubit.dart';
import 'package:e_commerce/features/product_details/cubit/product_details_state.dart';
import 'package:e_commerce/features/product_details/widget/add_card_widget.dart';
import 'package:e_commerce/features/product_details/widget/rate_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int? id;
  const ProductDetailsScreen({super.key, this.id});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState(id);
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  _ProductDetailsScreenState(this.id);
  final int? id;

  @override
  void initState() {
    context.read<ProductDetailsCubit>().getProductDetails(id ?? 0);
    super.initState();
  }

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
          leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              size: 24.sp,
              color: AppColors.blackColor,
            ),
          ),
        ),

        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
              builder: (context, state) {
                if (state is LoadingDetails) {
                  return LoadingWidget();
                } else if (state is ErrorDetails) {
                  return Center(
                    child: Text(
                      state.message,
                      style: AppStyles.black16W500TextStyle.copyWith(
                        color: Colors.red,
                      ),
                    ),
                  );
                } else if (state is SuccessDetails) {
                  Products products = state.products;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      CachedNetworkImage(
                        imageUrl: products.image ?? "",
                        width: double.infinity,
                        height: 368.h,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        products.title ?? "",
                        style: AppStyles.black16W500TextStyle,
                      ),
                      const SizedBox(height: 12),
                      RateWidget(
                        rate: products.rating!.rate.toString(),
                        reviews: products.rating!.count.toString(),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        products.description ?? "",
                        style: AppStyles.gray12MediumTextStyle.copyWith(
                          fontSize: 16.sp,
                        ),
                      ),
                      const SizedBox(height: 107),
                      AddCardWidget(price: products.price),
                    ],
                  );
                }
                return Center(
                  child: Text(
                    "Empty Details...",
                    style: AppStyles.black16W500TextStyle.copyWith(
                      color: Colors.red,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
