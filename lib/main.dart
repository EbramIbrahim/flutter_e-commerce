import 'package:e_commerce/core/network/dio_helper.dart';
import 'package:e_commerce/core/routing/router_generation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.dioInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) {
        return MaterialApp.router(
          title: 'E-Commerce',
          routerConfig: RouterGeneration.goRouter,
        );
      },
    );
  }
}
