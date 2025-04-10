import 'package:e_commerce/core/routing/app_router.dart';
import 'package:e_commerce/core/utils/service_locator.dart';
import 'package:e_commerce/features/account/widget/account_screen.dart';
import 'package:e_commerce/features/address/widget/address_screen.dart';
import 'package:e_commerce/features/cart/widget/cart_screen.dart';
import 'package:e_commerce/features/home/widget/home_screen.dart';
import 'package:e_commerce/features/login/cubit/login_cubit.dart';
import 'package:e_commerce/features/login/widget/login_screen.dart';
import 'package:e_commerce/features/product_details/widget/produce_details_screen.dart';
import 'package:e_commerce/features/register/cubit/register_cubit.dart';
import 'package:e_commerce/features/register/widget/register_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RouterGeneration {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRouter.loginScreen,
    routes: [
      GoRoute(
        path: AppRouter.loginScreen,
        name: AppRouter.loginScreen,
        builder:
            (context, state) => BlocProvider(
              create: (context) => sl<LoginCubit>(),
              child: LoginScreen(),
            ),
      ),
      GoRoute(
        path: AppRouter.registerScreen,
        name: AppRouter.registerScreen,
        builder:
            (context, state) => BlocProvider(
              create: (context) => sl<RegisterCubit>(),
              child: RegisterScreen(),
            ),
      ),
      GoRoute(
        path: AppRouter.homeScreen,
        name: AppRouter.homeScreen,
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: AppRouter.detailsScreen,
        name: AppRouter.detailsScreen,
        builder: (context, state) => ProduceDetailsScreen(),
      ),
      GoRoute(
        path: AppRouter.accountScreen,
        name: AppRouter.accountScreen,
        builder: (context, state) => AccountScreen(),
      ),
      GoRoute(
        path: AppRouter.addressScreen,
        name: AppRouter.addressScreen,
        builder: (context, state) => AddressScreen(),
      ),
      GoRoute(
        path: AppRouter.cartScreen,
        name: AppRouter.cartScreen,
        builder: (context, state) => CartScreen(),
      ),
    ],
  );
}
