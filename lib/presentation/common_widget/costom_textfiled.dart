import 'package:cbi/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CostomTextFiled extends StatelessWidget {
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
  final bool prefixIconShow;
  final TextInputType? keyboardType;
  final EdgeInsetsGeometry contentPadding;
  final int maxLines ;
  final Color cursorColor;
  final TextInputAction? textInputAction;
  const CostomTextFiled({
    super.key,
    required this.controller,
    this.inputFormatters,
    this.prefixIcon,
    this.prefixIconShow = false,
    this.keyboardType,
    this.contentPadding=  const EdgeInsets.symmetric(vertical: 10.0),
    this.maxLines=1,
    this.cursorColor = Colors.grey,
    this.textInputAction,

  });

  @override
  Widget build(BuildContext context) {
    return TextField(

      maxLines:maxLines ,


      cursorColor:cursorColor,
      controller: controller,
      inputFormatters: inputFormatters,
      cursorHeight: Get.size.width * 0.07,
      cursorWidth: 1.5,
      keyboardType:keyboardType ,
      textInputAction: textInputAction,
      decoration: InputDecoration(


        contentPadding:contentPadding,

        prefixIcon: prefixIconShow
            ?  prefixIcon
            : null,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.primaryColor),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.primaryColor)),
      ),
    );
  }
}
