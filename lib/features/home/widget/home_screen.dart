import 'package:e_commerce/core/styling/app_colors.dart';
import 'package:e_commerce/core/styling/app_styles.dart';
import 'package:e_commerce/core/widget/loading_item.dart';
import 'package:e_commerce/core/widget/primary_textfield_widget.dart';
import 'package:e_commerce/features/home/cubit/category_cubit.dart';
import 'package:e_commerce/features/home/cubit/category_state.dart';
import 'package:e_commerce/features/home/cubit/product_cubit.dart';
import 'package:e_commerce/features/home/cubit/product_state.dart';
import 'package:e_commerce/features/home/model/products.dart';
import 'package:e_commerce/features/home/widget/custom_search_category_item.dart';
import 'package:e_commerce/features/home/widget/product_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  String selectedCategory = "All";
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    context.read<CategoryCubit>().getCategories();
    context.read<ProductCubit>().getProducts();

    super.initState();
  }

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
              SizedBox(
                height: 50.h,
                child: BlocBuilder<CategoryCubit, CategoryState>(
                  builder: (context, state) {
                    if (state is CategorySuccess) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children:
                              state.categories.map((category) {
                                return CustomSearchCategoryItem(
                                  title: category,
                                  isPressed:
                                      selectedCategory == category
                                          ? true
                                          : false,
                                  onPressed: () {
                                    setState(() {
                                      selectedCategory = category;
                                      if (category == "All") {
                                        context
                                            .read<ProductCubit>()
                                            .getProducts();
                                      } else {
                                        context
                                            .read<ProductCubit>()
                                            .getCategoryProducts(category);
                                      }
                                    });
                                  },
                                );
                              }).toList(),
                        ),
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  },
                ),
              ),
              const SizedBox(height: 24),

              BlocBuilder<ProductCubit, ProductState>(
                builder: (context, state) {
                  if (state is ProductLoading) {
                    return LoadingWidget(
                      height: MediaQuery.of(context).size.height * 0.5,
                    );
                  } else if (state is ProductError) {
                    return Center(
                      child: Text(
                        state.message,
                        style: AppStyles.black16W500TextStyle.copyWith(
                          color: Colors.red,
                        ),
                      ),
                    );
                  } else if (state is ProductSuccess) {
                    List<Products> products = state.products;
                    return Expanded(
                      child: RefreshIndicator(
                        color: AppColors.primaryColor,
                        backgroundColor: AppColors.white,
                        onRefresh: () async {
                          setState(() {
                            selectedCategory = "All";
                          });
                          context.read<ProductCubit>().getProducts();
                        },
                        child: GridView(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 22.sp,
                                crossAxisSpacing: 2.sp,
                                childAspectRatio: 0.7,
                              ),

                          children:
                              products.map((product) {
                                return ProductCardItem(
                                  id: product.id,
                                  imageUrl: product.image ?? "",
                                  productName: product.title ?? "",
                                  productPrice: "€${product.price}",
                                );
                              }).toList(),
                        ),
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
