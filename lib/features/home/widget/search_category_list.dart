import 'package:e_commerce/features/home/widget/custom_search_category_item.dart';
import 'package:flutter/material.dart';

class SearchCategoryList extends StatelessWidget {
  const SearchCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      children: [
        CustomSearchCategoryItem(title: "All"),
        CustomSearchCategoryItem(title: "Tshirts"),
        CustomSearchCategoryItem(title: "Jeans"),
        CustomSearchCategoryItem(title: "Shoes"),
        CustomSearchCategoryItem(title: "Suit"),
      ],
    );
  }
}
