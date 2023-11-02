import 'package:cbi/presentation/common_widget/labels.dart';
import 'package:cbi/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoardMenuWidget extends StatelessWidget {
  final String titleName;
  final IconData? sufixIcons;
  final Color textColor;
  final void Function()? onTap;
  const DashBoardMenuWidget({
    super.key,
    required this.titleName,
    this.textColor = Colors.black,
    this.onTap,
    this.sufixIcons,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(height: Get.size.width * 0.03),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.size.width * 0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Labels(
                  text: titleName,
                  fontWeight: FontWeight.w600,
                  fontSize: Get.size.width * 0.036,
                  color: textColor,
                ),
                Icon(
                  sufixIcons,
                  color: AppColors.primaryColor,
                ),
              ],
            ),
          ),
          SizedBox(height: Get.size.width * 0.024),

        ],
      ),
    );
  }
}
