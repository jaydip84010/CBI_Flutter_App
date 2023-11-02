import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widget/labels.dart';
import '../../../utils/app_colors.dart';

class ResultMenuWidget extends StatelessWidget {
  final String title;
  final double amount;
  const ResultMenuWidget({
    super.key,
    required this.title,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Labels(
              text: title,
              fontWeight: FontWeight.w600,
              fontSize: Get.size.width * 0.03,
            ),
            const SizedBox(width: 4),
            Icon(
              Icons.info_outline,
              size: Get.size.width * 0.05,
              color: AppColors.grey,
            ),
            Expanded(child: Container()),
            Labels(
              text: "R${amount.toStringAsFixed(2)}",
              fontWeight: FontWeight.w600,
              fontSize: Get.size.width * 0.03,
            )
          ],
        ),

        Divider(
            endIndent: Get.size.width * 0.03,
            indent: Get.size.width * 0.03,
            color: AppColors.grey.withOpacity(0.6)),
      ],
    );
  }
}
