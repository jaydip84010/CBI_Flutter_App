import 'package:cbi/presentation/common_widget/labels.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class CustomBtn extends StatelessWidget {
  final double? height;
  final double? width;
  final Color btnColor;
  final Color textColor;
  final String btnName;
  final bool hideGradient;
  final void Function()? onTap;
  final double radius;
  const CustomBtn({
    super.key,
    this.height,
    this.width,
    this.btnColor = Colors.white,
    this.textColor = Colors.black,
    this.btnName = '',
    this.hideGradient = false,
    this.radius = 10,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          boxShadow: [
            BoxShadow(
              color: hideGradient ? AppColors.black : AppColors.white,
            )
          ],
          gradient: hideGradient
              ? const LinearGradient(
                  colors: [
                    AppColors.gradientSecondary,
                    AppColors.gradientPrimary,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                )
              : null,
          color: btnColor,
        ),
        child: Center(
          child: Labels(
            text: btnName,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
