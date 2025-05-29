import 'dart:convert';
import 'dart:io';

import 'package:btalk/api_client/app_chase.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../api_client/ApiController.dart';
import '../../../../../api_client/constant.dart';
import '../../../../../common_Controller/mis_controller.dart';
import '../../../../../common_model/UserInfo.dart';


class EditProfileController extends GetxController {
  final API api = API();
  final _miscController = MiscController();

  var isLoading = false.obs;
  RxString imagePath = "".obs;

  /// Selects an image from the gallery and updates `imagePath`
  Future<File?> selectImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagePath.value = image.path;
      return File(image.path);
    }
    return null; // User canceled
  }

  /// Updates the user's profile
  void updateProfile({
    required BuildContext context,
    required String name,
    required String email,
    required Function(bool isSuccess, String message) onComplete,
  }) async {
    isLoading.value = true;

    try {
      final hasInternet = await _miscController.checkInternet();
      if (!hasInternet.contains('ignore')) {

        dio.MultipartFile? multipartFile;

      if (imagePath.isNotEmpty && await File(imagePath.value).exists()) {
        multipartFile = await dio.MultipartFile.fromFile(
          imagePath.value,
          filename: "profile.jpg",
        );
      }
        dio.FormData data = dio.FormData.fromMap({
          "name": name,
          "email": email,
          if (imagePath.isNotEmpty)
            "profile_picture": await dio.MultipartFile.fromFile(
              imagePath.value,
              filename: imagePath.value.split('/').last,
            ),
        });

        final responseRaw = await api.updateData(
          endpoint: "/edit-profile/",
          data: data,
          token: AppCache().userInfo?.token// ✅ Correct: FormData passed directly
        );

        final response = jsonDecode(responseRaw);
        final success = response['Success'];
        final message = response['Message'];

        if (success) {
          final packet = response['Packet']['data'];
          UserInfo user = UserInfo.fromJson(packet);
          SharedPreferences preference = await _miscController.pref();
          _miscController.prefSetString(pref: preference, key: Constant.userInfoPref, value: userInfoToJson(user));
          AppCache(userInfo: user);
          refresh();


          onComplete(true, 'Your OTP has been sent to your email');
        } else {
          onComplete(false, 'Upload Failed: $message');
        }
      } else {
        onComplete(false, "Internet Error!\nYou are offline. Please check your internet connection.");
      }
    } catch (e, stackTrace) {
      print("Upload Error: $e\n$stackTrace");
      onComplete(false, 'Upload Error: Something went wrong.');
    } finally {
      isLoading.value = false;
    }
  }
}
