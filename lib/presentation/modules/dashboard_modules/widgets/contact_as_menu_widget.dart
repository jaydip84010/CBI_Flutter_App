import 'package:cbi/presentation/common_widget/labels.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';

class ContactAsWidget extends StatelessWidget {
  final double height;
  final double width;
  final Widget? child;
  final String indexNo;
  const ContactAsWidget({
    super.key,
    this.height = 50,
    this.width = 20,
    this.indexNo = '',
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: Get.size.width * 0.1),
          child: Container(
            height: Get.size.width * 0.07,
            width: Get.size.width * 0.26,
            decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black,
                  )
                ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                gradient: LinearGradient(
                  colors: [
                    AppColors.gradientSecondary,
                    AppColors.gradientPrimary,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                )),
            child: Center(
              child: Labels(
                text: indexNo,
                color: AppColors.white,
                fontSize: Get.size.width * 0.04,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: AppColors.primaryColor,
            ),
          ),
          child: child,
        )
      ],
    );
  }
}
