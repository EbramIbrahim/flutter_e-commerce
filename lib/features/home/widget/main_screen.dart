import 'package:e_commerce/core/styling/app_colors.dart';
import 'package:e_commerce/core/utils/service_locator.dart';
import 'package:e_commerce/features/account/widget/account_screen.dart';
import 'package:e_commerce/features/cart/widget/cart_screen.dart';
import 'package:e_commerce/features/home/cubit/category_cubit.dart';
import 'package:e_commerce/features/home/cubit/product_cubit.dart';
import 'package:e_commerce/features/home/widget/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  List<Widget> screens = [
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<ProductCubit>()),
        BlocProvider(create: (context) => sl<CategoryCubit>()),
      ],
      child: HomeScreen(),
    ),
    CartScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.grey,
          elevation: 1,
          selectedItemColor: AppColors.primaryColor,
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 30.sp),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart, size: 30.sp),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_3_outlined, size: 30.sp),
              label: "Account",
            ),
          ],
        ),
      ),
    );
  }
}
