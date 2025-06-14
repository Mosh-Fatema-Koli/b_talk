
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/colors.dart';

class CustomButton extends StatelessWidget {

  final String text;
  final Color? textColor;
  final Color? buttonColor;
  final double? buttonTextSize;
  final double? buttonHeight;
  final double? buttonWidth;
  final double? buttonRadius;
  final EdgeInsets? buttonPadding;
  final Function onPressed;

  const CustomButton({
    super.key,
    required this.text,
    this.textColor,
    this.buttonColor,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonRadius,
    required this.onPressed,
    this.buttonTextSize,
    this.buttonPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.colorButton,
            AppColors.colorButton2,
          ],
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(buttonRadius??12).r),
          minWidth: buttonWidth ?? Get.width.w,
          height: buttonHeight ?? 40.h,
          onPressed: () {
            onPressed();
          },
          child: Padding(
            padding: buttonPadding ?? const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8).w,
            child: Text(text, style: TextStyle(fontSize: buttonTextSize ?? 16.sp, color: textColor ?? Colors.white),),
          )),
    );
  }
}
