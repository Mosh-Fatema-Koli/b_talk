import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';



class RFText extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? fontSize;

  final String? fontFamily;
  final int? maxLines;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final double? wordSpacing;
  final double? letterSpacing;

  final TextDirection? textDirection;
  final TextDecoration? decoration;
  TextOverflow? overflow;
  bool? isHeadTitle;
  Paint? foreground;
  RFText({
    required this.text,
    this.color,
    this.fontSize,
    this.fontFamily,
    this.maxLines,
    this.fontWeight,
    this.textAlign,
    this.textDirection,
    this.wordSpacing,
    this.letterSpacing,
    this.decoration,
    this.overflow,
    this.isHeadTitle,
    this.foreground,
  });

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Get.isDarkMode;
    return Text(
      '$text',
      style: GoogleFonts.lato(
        decoration: decoration,
        fontSize: fontSize ?? 12.sp,
        fontWeight: fontWeight ?? FontWeight.w500,
        color: color ?? Colors.black,
        wordSpacing: wordSpacing,
        letterSpacing: letterSpacing,
        foreground: foreground,
      ),
      maxLines: maxLines,
      textAlign: textAlign,
      textDirection: textDirection,
    );
  }
}