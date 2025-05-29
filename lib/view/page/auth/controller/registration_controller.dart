import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../api_client/ApiController.dart';
import '../../../../api_client/app_chase.dart';
import '../../../../api_client/constant.dart';
import '../../../../common_Controller/mis_controller.dart';
import '../../../../common_model/UserInfo.dart';

class RegistrationController extends GetxController{

  API api = API();
  final _miscController = MiscController();
  var isLoading = false.obs;

  //region Reg API
  void registration({
    required BuildContext context,
    required String name,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
    required Function(bool isSuccess, String message) onComplete,
  }) async {
    isLoading.value = true;
    try {
      final hasInternet = await _miscController.checkInternet();
      if (!hasInternet.contains('ignore')) {
        if (password != confirmPassword) {
          isLoading.value = false;
          onComplete(false, 'Passwords do not match');
          return;
        }else{

          var data = {
            "name": name,
            "phone_number": phone,
            "email": email,
            "password": password,
            "confirm_password": confirmPassword
          };

          var apiResponse = await api.postData(
            endpoint: "/register/",
            data: jsonEncode(data),
          );

          var response = jsonDecode(apiResponse);
          var success = response['Success'];
          var message = response['Message'];
          isLoading.value = false;
          if (success) {
            var packet = response['Packet'];
            SharedPreferences preference = await _miscController.pref();
            _miscController.prefSetString(pref: preference, key: Constant.userPhoneNo, value: phone);

            onComplete(true, 'Your Opt Sent in your email');
          } else {
            onComplete(false, 'Upload Failed: $message');
          }

        }

      } else {
        isLoading.value = false;
        onComplete(false, "Internet Error!\nYou are offline, Please check your internet connection.");
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