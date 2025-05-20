
import 'dart:io';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../view/widgets/alart_dialog.dart';
import '../view/widgets/framework/RFGraphicalDialog.dart';
import '../view/widgets/framework/RFProgressDialog.dart';



class MiscController {

  //No history
  navigateOff(dynamic page, {var argument}){
    return Get.off(page, arguments: argument);
  }

  navigateOffNamed(String page, {var argument}){
    return Get.offNamed(page, arguments: argument);
  }

  navigateBack(){
    return Get.back();
  }

  navigateToNative(BuildContext context, dynamic page) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  Future<SharedPreferences> pref() async {
    return await SharedPreferences
        .getInstance();
  }

  prefSetString({required SharedPreferences pref, required String key, required String value}){
    pref.setString(key, value);
  }

  prefSetInt({required SharedPreferences pref, required String key, required int value}){
    pref.setInt(key, value);
  }

  prefSetBool({required SharedPreferences pref, required String key, required bool value}){
    pref.setBool(key, value);
  }

  String? prefGetString({required SharedPreferences pref, required String key}) {
    return pref.getString(key);
  }

  int? prefGetInt({required SharedPreferences pref, required String key}){
    return pref.getInt(key);
  }

  bool? prefGetBool({required SharedPreferences pref, required String key}){
    return pref.getBool(key);
  }

  prefRemove({required SharedPreferences pref, required String key}){
    pref.remove(key);
  }

  prefRemoveAll({required SharedPreferences pref}){
    pref.clear();
  }

  Future showAlertDialog({required BuildContext context, required bool cancelable, required String title, required String subTitle, required String okText, required Function okPressed, String? cancelText, Function? cancelPressed}){
    return showDialog(
        context: context,
        barrierDismissible: cancelable ? true : false,
        builder: (BuildContext context) {
          return PopScope(
              canPop: cancelable ? true : false,
              child: RFAlertDialog(
                  title: title,
                  subTitle: subTitle,
                  okText: okText,
                  cancelText: cancelText,
                  cancelPressed: cancelPressed,
                  okPressed: okPressed)
          );
        });
  }

  Future showGraphicalDialog({required BuildContext context, required bool cancelable, String? imagePath, String? title, String? subTitle, Color? titleColor, Color? subTitleColor,
    String? okText, Function? okPressed, String? cancelText, Function? cancelPressed}){
    return showDialog(
        context: context,
        barrierDismissible: cancelable ? true : false,
        builder: (BuildContext context) {
          return PopScope(
              canPop: cancelable ? true : false,
              child: RFGraphicalDialog(
                imagePath: imagePath,
                title: title,
                subTitle: subTitle,
                okText: okText,
                cancelText: cancelText,
                titleColor: titleColor,
                subTitleColor: subTitleColor,
                okPressed: okPressed,
                cancelPressed: cancelPressed,
              ));
        });
  }

  Future showCustomWidgetDialog({required BuildContext context, double? leftPadding, double? rightPadding, required bool cancelable, required Widget dialogContent}){
    return showDialog(
        context: context,
        barrierDismissible: cancelable ? true : false,
        builder: (BuildContext context) {
          return PopScope(
              canPop: cancelable ? true : false,
              child: AlertDialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12).r),
                contentPadding: EdgeInsets.only(left: leftPadding ?? 24, right: rightPadding ?? 24, top: 8).w,
                content: dialogContent,
              ));
        });
  }

  Future showBottomSheet({required BuildContext context, bool? isDismissible, double? height, required Widget content}){
    return showModalBottomSheet (
      context: context,
      isDismissible: isDismissible ?? true,
      enableDrag: false,
      builder: (BuildContext context) {
        return PopScope(
          canPop: isDismissible ?? true,
          child: Wrap(
            children: [
              Container(
                height: height,
                color: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(32).r,
                          topRight: const Radius.circular(32).r)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0).w,
                    child: content,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future delayed({required int milliseconds, Function? onDelayed}) async {
    return await Future.delayed(const Duration(milliseconds: 500), () {if(onDelayed!=null)onDelayed();});
  }

  Future showProgressDialog({required BuildContext context, String? title, String? subTitle}){
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return PopScope(
              canPop: false,
              child: RFProgressDialog(
                  title: title,
                  subTitle: subTitle)
          );
        });
  }

  //region internet check
  Future checkInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return connectivityResult;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return connectivityResult;
    }
  }

  Future createInternetErrorSnackBar(bool exitFromTheApp) async {
    Get.snackbar(
      'Internet Error!',
      'Please check your internet connection.',
      duration: const Duration(days: 365),
      backgroundColor: Colors.red[100],
      snackPosition: SnackPosition.BOTTOM,
      maxWidth: Get.width,
      colorText: Colors.black87,
      mainButton: TextButton(
        child: const Text('CANCEL', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),),
        onPressed: () {
          Get.back();
          if(exitFromTheApp){
            exit(0);
          }
        },
      ),
    );
  }
  //endregion

  Future createErrorSnackBar({required String title, Duration? duration, required String message, required bool exitFromTheApp}) async {
    Get.snackbar(
      title,
      message,
      duration: duration ?? const Duration(days: 365),
      backgroundColor: Colors.red[100],
      snackPosition: SnackPosition.BOTTOM,
      maxWidth: Get.width,
      colorText: Colors.black87,
      mainButton: TextButton(
        child: const Text('CANCEL', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),),
        onPressed: () {
          Get.back();
          exitFromTheApp ? exit(0) : null;
        },
      ),
    );
  }

  Future createSuccessSnackBar({required String title, Duration? duration, required String message}) async {
    Get.snackbar(
      title,
      message,
      duration: duration ?? const Duration(seconds: 3),
      backgroundColor: Colors.green[100],
      snackPosition: SnackPosition.BOTTOM,
      maxWidth: Get.width,
      colorText: Colors.black87,
    );
  }

  //region get unique Id
  String getUniqueId() {
    //const String pushChars = '-0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz';
    const String pushChars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
    int lastPushTime = 0;
    List lastRandChars = [];
    int now = DateTime.now().millisecondsSinceEpoch;
    bool duplicateTime = (now == lastPushTime);
    lastPushTime = now;
    List timeStampChars = List<String>.filled(8, '0');
    for (int i = 7; i >= 0; i--) {
      //timeStampChars[i] = pushChars[now % 64];
      timeStampChars[i] = pushChars[now % 62];
      //now = (now / 64).floor();
      now = (now / 62).floor();
    }
    if (now != 0) {
      print("Id should be unique");
    }
    String uniqueId = timeStampChars.join('');
    if (!duplicateTime) {
      for (int i = 0; i < 12; i++) {
        //lastRandChars.add((Random().nextDouble() * 64).floor());
        lastRandChars.add((Random().nextDouble() * 62).floor());
      }
    } else {
      int i = 0;
      //for (int i = 11; i >= 0 && lastRandChars[i] == 63; i--) {
      for (int i = 11; i >= 0 && lastRandChars[i] == 61; i--) {
        lastRandChars[i] = 0;
      }
      lastRandChars[i]++;
    }
    for (int i = 0; i < 12; i++) {
      uniqueId += pushChars[lastRandChars[i]];
    }
    return uniqueId;
  }
  //endregion

  //region get Current Date
  String getCurrentDate(){
    return DateFormat("yyyy-MM-dd").format(DateTime.now());
  }
  //endregion

  //region get current time
  String getCurrentTime(){
    return DateFormat("hh:mm:ss a").format(DateTime.now());
  }
  //endregion

  //region return formatted date
  String formattedDateString({required var dateString}){
    String outputDate = '';
    final DateFormat inputFormat = DateFormat('yyyy-MM-dd');
    final DateFormat outputFormat = DateFormat('dd MMM yyyy');
    if (dateString!=null) {
      if (dateString.toString().isNotEmpty) {
        DateTime inputDate = inputFormat.parse(dateString).toLocal();
        outputDate = outputFormat.format(inputDate);
      }
    }
    return outputDate;
  }
  //endregion

  //region return string from date (yyyy-MM-dd)
  String stringFromDate({required DateTime date}){
    String dateString = '';
    final DateFormat outputFormat = DateFormat('yyyy-MM-dd');
    dateString = outputFormat.format(date);
    return dateString;
  }
  //endregion

  //region return Date from string
  DateTime dateTimeFromString({required var dateString}){
    DateTime dateTime = DateTime.now();
    if(dateString!=null){
      if (dateString.toString().isNotEmpty) {
        dateTime = DateTime.parse(dateString);
      }
    }
    return dateTime;
  }
//endregion

}