import 'package:e_commerce/features/home/cubit/category_cubit.dart';
import 'package:e_commerce/features/home/cubit/category_state.dart';
import 'package:e_commerce/features/home/cubit/product_cubit.dart';
import 'package:e_commerce/features/home/widget/custom_search_category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCategoryList extends StatefulWidget {
  const SearchCategoryList({super.key});

  @override
  State<SearchCategoryList> createState() => _SearchCategoryListState();
}

class _SearchCategoryListState extends State<SearchCategoryList> {
  String selectedCategory = "";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategorySuccess) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children:
                  state.categories.map((category) {
                    return CustomSearchCategoryItem(
                      title: category,
                      isPressed: selectedCategory == category,
                      onPressed: () {
                        setState(() {
                          selectedCategory = category;
                          context.read<ProductCubit>().getCategoryProducts(
                            category,
                          );
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
    );
  }
}
