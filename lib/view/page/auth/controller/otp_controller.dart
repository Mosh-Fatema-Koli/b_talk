import 'dart:convert';

import 'package:btalk/view/page/auth/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../api_client/ApiController.dart';
import '../../../../api_client/app_chase.dart';
import '../../../../api_client/constant.dart';
import '../../../../common_Controller/mis_controller.dart';
import '../../../../common_model/UserInfo.dart';

class OTPController extends GetxController{

  API api = API();
  final _miscController = MiscController();
  var isLoading = false.obs;

  void otp({
    required BuildContext context,
    required String phone,
    required String pin,
    required Function(bool isSuccess, String message) onComplete,
  }) async {
    isLoading.value = true;
    try {
      var data = {
        "phone_number": phone,
        "otp": pin,
      };
print(data);
      var apiResponse = await api.postData(
        endpoint: "/verify-otp/",
        data: jsonEncode(data),
      );

      var response = jsonDecode(apiResponse);
      var success = response['Success'];
      var message = response['Message'];
      isLoading.value = false;
      if (success) {
        var packet = response['Packet'];
        _miscController.toast(msg: "OTP matched, Please login ");
        Get.offAll(LogINPage());
        onComplete(true, 'OTP matched, Please login ');
      } else {
        onComplete(false, 'Upload Failed: $message');
      }
    } catch (e) {
      isLoading.value = false;
      print("Upload Error: $e");
      onComplete(false, 'Upload Error: Something went wrong.');
    } finally {
      isLoading.value = false;
    }
  }
}


