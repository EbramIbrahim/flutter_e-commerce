import 'package:e_commerce/core/styling/app_styles.dart';
import 'package:flutter/material.dart';

class TopRegisterHeadline extends StatelessWidget {
  final String title;
  final String subtitle;
  const TopRegisterHeadline({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppStyles.titleTextStyle),
        const SizedBox(height: 8),
        Text(subtitle, style: AppStyles.subtitleTextStyle),
      ],
    );
  }
}
