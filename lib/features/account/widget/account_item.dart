import 'package:e_commerce/core/styling/app_assets.dart';
import 'package:e_commerce/core/styling/app_styles.dart';
import 'package:flutter/material.dart';

class AccountItem extends StatelessWidget {
  final String icon;
  final String title;

  const AccountItem({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(icon),
        const SizedBox(width: 16),
        Text(title, style: AppStyles.black16W500TextStyle),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Image.asset(AppAssets.arrow),
          ),
        ),
      ],
    );
  }
}
