import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../api_client/ApiController.dart';
import '../../../../api_client/app_chase.dart';
import '../../../../api_client/constant.dart';
import '../../../../common_Controller/mis_controller.dart';
import '../../../../common_model/UserInfo.dart';

class LoginController extends GetxController{

  API api = API();
  final _miscController = MiscController();
  var isLoading = false.obs;

  //region LOGIN API
  Future login({required String username, required String password, required bool isOnlineApp, required bool isFromSplash, required Function(bool isSuccess, String message) onLoginResult}) async {
    isLoading.value=true;
    await _miscController.checkInternet().then((value) async {
      if (!value.contains('ignore')) {
        var loginResponse = await api.login(username: username ?? '', password: password ?? '');
        var success = jsonDecode(loginResponse)['Success'];
        var message = jsonDecode(loginResponse)['Message'];
        if (success) {
          try {
            var packet = jsonDecode(loginResponse)['Packet'];
            UserInfo user = UserInfo.fromJson(packet);
            SharedPreferences preference = await _miscController.pref();
            _miscController.prefSetString(pref: preference, key: Constant.userInfoPref, value: userInfoToJson(user));
            AppCache(userInfo: user);
            isLoading.value=false;
            onLoginResult(true, 'Login Success');
          } catch (ex) {
            isLoading.value=false;
            onLoginResult(false, 'Login Error : ${ex.toString()}');
          }
        } else {
          onLoginResult(false, 'Login Error : $message');
          isLoading.value=false;
        }
      } else {
        if(isOnlineApp){
          isLoading.value=false;
          onLoginResult(false, "Internet Error!\nYou are offline, Please check your internet connection.");
        } else {
          if(isFromSplash){
            isLoading.value=false;
            onLoginResult(true, '');
          } else {
            isLoading.value=false;
            onLoginResult(false, "Internet Error!\nYou are offline, Please check your internet connection.");
          }
        }
      }
    });
  }
  //endregion


  //region logout
  Future logout({required BuildContext context, required Function onLogout}) async {
    if(context.mounted){
      await _miscController.showGraphicalDialog(
          context: context,
          cancelable: false,
          imagePath: 'assets/images/exit.png',
          title: 'Logout',
          subTitle: 'Do you want to logout now?',
          okText: 'Yes',
          okPressed: () async {
            Navigator.pop(context);
            _miscController.delayed( millisecond: 2000,);
            _miscController.showProgressDialog(context: context);
            if(context.mounted){
              await _finalLogOut(onOut: onLogout, context: context);
            }
          },
          cancelText: 'NO',
          cancelPressed: () {
            Navigator.pop(context);
          });
    }
  }
  //endregion

  //region final out
  Future _finalLogOut({required BuildContext context, required Function onOut}) async {
    SharedPreferences pref = await _miscController.pref();
    _miscController.prefRemoveAll(pref: pref);
    AppCache().userInfo = UserInfo();
    if(context.mounted) {
      Navigator.pop(context);
    }
    onOut();
  }
//endregion

}