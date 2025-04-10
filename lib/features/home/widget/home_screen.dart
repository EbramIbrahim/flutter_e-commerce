import 'package:e_commerce/core/styling/app_colors.dart';
import 'package:e_commerce/core/styling/app_styles.dart';
import 'package:e_commerce/core/widget/primary_textfield_widget.dart';
import 'package:e_commerce/features/home/widget/search_card_item.dart';
import 'package:e_commerce/features/home/widget/search_category_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          automaticallyImplyLeading: false,
          forceMaterialTransparency: false,
          elevation: 0.0,
          scrolledUnderElevation: 0.0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text("Discover", style: AppStyles.titleTextStyle),
              const SizedBox(height: 16),

              Row(
                children: [
                  PrimaryTextfieldWidget(
                    width: 281.w,
                    hintText: "Search for clothes...",
                    preffixIcon: Icon(
                      Icons.search,
                      size: 24.sp,
                      color: AppColors.grayColor,
                    ),
                    controller: searchController,
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 52.w,
                    height: 52.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: AppColors.primaryColor,
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.filter_hdr,
                      color: AppColors.white,
                      size: 24.sp,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(height: 50.h, child: SearchCategoryList()),
              const SizedBox(height: 24),

              Expanded(
                child: GridView.builder(
                  itemCount: 10,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 22.sp,
                    crossAxisSpacing: 2.sp,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) {
                    return SearchCardItem(
                      imageUrl:
                          "https://chriscross.in/cdn/shop/files/ChrisCrossNavyBlueCottonT-Shirt.jpg?v=1740994598",
                      productName: "Fit Polo T Shirt",
                      productPrice: "1,100",
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
