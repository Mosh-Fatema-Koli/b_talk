
import 'package:btalk/view/page/bottom_Nav_Bar/navBar.dart';
import 'package:btalk/view/page/intro/intro.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../api_client/constant.dart';
import '../../../../common_Controller/mis_controller.dart';
import '../../auth/controller/login_controller.dart';
class SplashController extends GetxController {

  final _miscController = MiscController();
  final logInController = Get.put(LoginController());
  RxBool isLoading = false.obs;

  @override
  Future<void> onInit() async {
    jumpPage();
    super.onInit();
  }

  jumpPage() async {

    Future.delayed(const Duration(seconds: 2), () async {
      SharedPreferences preference = await _miscController.pref();
      String? Phone = await preference.get(Constant.userPhoneNo).toString();
      String? pass = await preference.get(Constant.password).toString();
      String? token = await preference.get(Constant.token).toString();


      if (token.isNotEmpty) {
        logInController.login(username: Phone,
          password: pass,
          isOnlineApp: true,
          isFromSplash: true,
          onLoginResult: (isSuccess, message) {
            isSuccess==false? Get.off(IntroPage()):Get.off(NavbarPage());
          },);
      } else {
        print("2nd");
        Get.offAll(IntroPage());
      }
    });
  }



  }




