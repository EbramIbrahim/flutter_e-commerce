import 'package:e_commerce/core/styling/app_colors.dart';
import 'package:e_commerce/core/styling/app_styles.dart';
import 'package:e_commerce/features/address/widget/address_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddressScreen();
}

class _AddressScreen extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          backgroundColor: AppColors.white,
          title: Text("Address", style: AppStyles.titleTextStyle),
          centerTitle: true,
          leading: Icon(
            Icons.arrow_back,
            size: 24.sp,
            color: AppColors.blackColor,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Divider(thickness: 1),
              const SizedBox(height: 20),
              Text("Saved Address", style: AppStyles.black16W500TextStyle),
              const SizedBox(height: 14),
              Expanded(
                child: ListView(
                  children: [
                    AddressCardWidget(),
                    AddressCardWidget(),
                    AddressCardWidget(),
                    AddressCardWidget(),
                    AddressCardWidget(),
                    AddressCardWidget(),
                    AddressCardWidget(),
                  ],
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
