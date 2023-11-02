import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool? softWrap;
  final FontWeight? fontWeight;
  final Color? color;
  final double? fontSize;
  final double? height;
  final FontStyle? fontStyle;
  const Labels({
    Key? key,
    required this.text,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.softWrap,
    this.fontWeight,
    this.color,
    this.fontSize,
    this.height,
    this.fontStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
      style: TextStyle(
        height: height,
        fontWeight: fontWeight,
        color: color,
        fontSize: fontSize,
        fontStyle: fontStyle,
      ),
    );
  }
}
