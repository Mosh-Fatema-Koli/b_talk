

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../common_Controller/mis_controller.dart';


class RFDatePicker extends StatelessWidget {

  final String name;
  var dateValue;
  final String? hintText;
  final TextEditingController controller;
  final Widget? icon;
  final Function(String dateValue, Map<String, dynamic> jsonMapResult) onChange;
  Color? textColor;
  Color? hintTextColor;
  double? textSize;
  bool? readOnly;
  BoxDecoration? decoration;
  Map<String, dynamic>? jsonMap;
  final _miscController = MiscController();

  RFDatePicker({
    super.key,
    required this.name,
    required this.dateValue,
    this.hintText,
    required this.controller,
    this.icon,
    required this.onChange,
    this.textColor,
    this.textSize,
    this.readOnly,
    this.decoration,
    this.jsonMap,
  });

  Map<String, dynamic>? _addValueToModel(String value, String name){
    jsonMap![name] = value.toString();
    return jsonMap;
  }

  @override
  Widget build(BuildContext context) {
    String fieldName = name;
    bool disable = readOnly ?? false;
    controller.text = _miscController.formattedDateString(dateString: dateValue) ?? '';
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
        borderRadius: BorderRadius.circular(8).r,
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 10.w),
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.go,
          maxLines: 1,
          style: TextStyle(fontSize: textSize ?? 15.sp, color: textColor ?? Colors.black87),
          readOnly: true,
          onTap: () async {
            if(disable){
              null;
            } else {
              final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: _miscController.dateTimeFromString(dateString: dateValue),
                  firstDate: DateTime(2015, 8),
                  lastDate: DateTime(2101));
              if (picked != null && picked != _miscController.dateTimeFromString(dateString: dateValue)) {
                String databaseDate = _miscController.stringFromDate(date: picked);
                controller.text = _miscController.formattedDateString(dateString: databaseDate) ?? '';
                onChange(databaseDate, _addValueToModel(databaseDate, fieldName)!);
              }
            }
          },
          decoration: InputDecoration(
            hintText: hintText ?? '',
            hintStyle: TextStyle(fontSize: textSize ?? 15.sp, color: hintTextColor ?? Colors.grey.withOpacity(.8)),
            border: InputBorder.none,
            suffixIcon: icon,
          ),
        ),
      ),
    );
  }
}
