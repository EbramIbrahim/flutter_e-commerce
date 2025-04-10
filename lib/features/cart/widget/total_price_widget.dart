import 'package:e_commerce/features/cart/widget/type_of_payments_text.dart';
import 'package:flutter/material.dart';

class TotalPriceWidget extends StatelessWidget {
  const TotalPriceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TypeOfPaymentsText(paymentText: "Sub-total", paymentPriceText: "5,870"),
        const SizedBox(height: 16),
        TypeOfPaymentsText(paymentText: "VAT (%)", paymentPriceText: "0.00"),
        const SizedBox(height: 16),
        TypeOfPaymentsText(paymentText: "Shipping fee", paymentPriceText: "80"),

        Divider(thickness: 2),
        TypeOfPaymentsText(paymentText: "Total", paymentPriceText: "5,950"),
      ],
    );
  }
}
