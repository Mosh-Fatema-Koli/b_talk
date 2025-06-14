
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../api_client/ApiController.dart';
import '../../../../api_client/app_chase.dart';
import '../../../../api_client/constant.dart';
import '../../../../common_Controller/mis_controller.dart';
import '../../../../common_model/UserInfo.dart';

class ContactListController extends GetxController{

  API api = API();
  final _miscController = MiscController();
  var isLoading = false.obs;
  RxList<Contact> contacts = <Contact>[].obs;


  Future<void> fetchContacts({required BuildContext context}) async {

    isLoading.value = true;

    var permissionStatus = await Permission.contacts.status;
    if (!permissionStatus.isGranted) {
      permissionStatus = await Permission.contacts.request();
    }

    if (permissionStatus.isGranted) {
      final fetched = await FlutterContacts.getContacts(withProperties: true);
      contacts.assignAll(fetched);
      refresh();
      contactListSend(context: context, numberList:contacts , onComplete: (isSuccess, message) {

      },);
    } else {
      Get.snackbar("Permission Denied", "Contacts permission was not granted");
    }

    isLoading.value = false;
  }


  //region Reg API
  void contactListSend({
    required BuildContext context,
    required List numberList,
    required Function(bool isSuccess, String message) onComplete,
  }) async {
    isLoading.value = true;
    try {
      final hasInternet = await _miscController.checkInternet();
      if (!hasInternet.contains('ignore')) {
        var data = {
          "phone_numbers": [
            "01626681292",
            "01626681294"
          ]
        };

        var apiResponse = await api.postData(
          endpoint: "/import-contacts/",
          data: jsonEncode(data),
        );

        var response = jsonDecode(apiResponse);
        var success = response['Success'];
        var message = response['Message'];
        isLoading.value = false;
        if (success) {
          var packet = response['Packet'];
          onComplete(true, 'Your Opt Sent in your email');
        } else {
          onComplete(false, 'Upload Failed: $message');
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



  //region contactListGet
  void contactListGet({
    required BuildContext context,
    required Function(bool isSuccess, String message) onComplete,
  }) async {
    isLoading.value = true;
    try {
      final hasInternet = await _miscController.checkInternet();
      if (!hasInternet.contains('ignore')) {

          var apiResponse = await api.fetchListData(
            endpoint: "/export-contacts/",
            token: AppCache().userInfo?.token
          );

          var response = jsonDecode(apiResponse);
          var success = response['Success'];
          var message = response['Message'];
          isLoading.value = false;
          if (success) {
            var packet = response['Packet'];
            SharedPreferences preference = await _miscController.pref();
            onComplete(true, 'Your Opt Sent in your email');
          } else {
            onComplete(false, 'Upload Failed: $message');
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