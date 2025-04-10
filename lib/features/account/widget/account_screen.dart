import 'package:e_commerce/core/styling/app_assets.dart';
import 'package:e_commerce/core/styling/app_colors.dart';
import 'package:e_commerce/core/styling/app_styles.dart';
import 'package:e_commerce/features/account/widget/account_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AccountScreen();
}

class _AccountScreen extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          backgroundColor: AppColors.white,
          title: Text("Account", style: AppStyles.titleTextStyle),
          centerTitle: true,
          leading: Icon(
            Icons.arrow_back,
            size: 24.sp,
            color: AppColors.blackColor,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                Divider(thickness: 1),
                const SizedBox(height: 20),

                AccountItem(icon: AppAssets.order, title: "My Orders"),
                const SizedBox(height: 25),
                Divider(thickness: 8, color: AppColors.grayColor),

                const SizedBox(height: 25),
                AccountItem(icon: AppAssets.details, title: "My Details"),
                const SizedBox(height: 25),
                Divider(thickness: 1),

                const SizedBox(height: 25),
                AccountItem(icon: AppAssets.address, title: "Address Book"),
                const SizedBox(height: 25),
                Divider(thickness: 1),

                const SizedBox(height: 25),
                AccountItem(icon: AppAssets.faq, title: "FAQs"),
                const SizedBox(height: 25),
                Divider(thickness: 1),

                const SizedBox(height: 25),
                AccountItem(icon: AppAssets.help, title: "Help Center"),
                const SizedBox(height: 25),
                Divider(
                  thickness: 8,
                  color: AppColors.grayColor.withValues(alpha: 0.3),
                ),

                const SizedBox(height: 175),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(AppAssets.logout),
                    const SizedBox(width: 16),

                    Text(
                      "Logout",
                      style: AppStyles.black16W500TextStyle.copyWith(
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 75),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
