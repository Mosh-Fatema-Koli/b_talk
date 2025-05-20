
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RFTextField extends StatelessWidget {

  final String? name;
  var textValue;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? Sicon;
  final Widget? Picon;
  final dynamic keyboard;
  final int? maximumLine;
  final double? radius;
  final dynamic readonly;
  final Function(String textValue, Map<String, dynamic>? jsonMapResult)? onChange;
  final Function(String textValue, Map<String, dynamic>? jsonMapResult)? onComplete;
  String? dataType;
  Color? textColor;
  Color? hintTextColor;
  double? textSize;
  BoxDecoration? decoration;
  TextInputAction? inputAction;
  Map<String, dynamic>? jsonMap;

  RFTextField({
    super.key,
    this.name,
    this.textValue,
    this.textColor,
    required this.controller,
    this.onChange,
    this.hintText,
    this.hintTextColor,
    this.textSize,
    this.Sicon,
    this.Picon,
    this.keyboard,
    this.maximumLine,
    this.radius,
    this.readonly,
    this.dataType,
    this.inputAction,
    this.onComplete,
    this.jsonMap,
  });

  Map<String, dynamic>? _addValueToModel(String value, String name, String type){
    if(name.isNotEmpty){
      jsonMap![name] = type == 'int' ? int.parse(value.toString()) : value.toString();
    }
    return jsonMap;
  }

  @override
  Widget build(BuildContext context) {
    String type = dataType ?? 'text';
    String fieldName = name ?? '';
    String defaultText = '';
    if (textValue != null) {
      defaultText = textValue.toString();
    }
    controller?.text = defaultText;
    return Container(
      width: Get.width.w,
      decoration: decoration ?? BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(
                0, 0), // changes position of shadow
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius??8).r,
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 15.w),
        child: TextFormField(
          cursorHeight: 15,
          expands: false,
          controller: controller,
          keyboardType: keyboard ?? TextInputType.text,
          textInputAction: inputAction ?? TextInputAction.go,
          maxLines: maximumLine ?? 1,
          style: TextStyle(fontSize: textSize ?? 15.sp, color: textColor ?? Colors.black87),
          readOnly: readonly ?? false,
          onEditingComplete: () {
            FocusManager.instance.primaryFocus?.unfocus();
            if(onComplete!= null){
              onComplete!(controller!.text.toString(), _addValueToModel(controller!.text.toString(), fieldName, type));
            }
          },
          onChanged: (value) {
            if(onChange != null){
              onChange!(value.toString(), _addValueToModel(value.toString(), fieldName, type));
            }
          },
          decoration: InputDecoration(
            hintText: hintText ?? '',
            hintStyle: TextStyle(fontSize: textSize ?? 12.sp, color: hintTextColor ?? Colors.grey.withOpacity(.8)),
            border: InputBorder.none,
            suffixIcon: Sicon,
            prefixIcon: Picon,
          ),
        ),
      ),
    );
  }
}
