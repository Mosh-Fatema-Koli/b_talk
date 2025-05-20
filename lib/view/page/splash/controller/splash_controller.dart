
import 'package:btalk/view/page/intro/intro.dart';
import 'package:get/get.dart';
class SplashController extends GetxController {



  RxBool isLoading = false.obs;

  @override
  Future<void> onInit() async {
    jumpPage();
    super.onInit();
  }

  jumpPage() async {

    Future.delayed(const Duration(seconds: 2), () async {
      Get.offAll(const IntroPage());
      // var isFirstTime = await PrefsHelper.getString(ShareprefSave.isFirstTime);
      // var token = await PrefsHelper.getString(
      //   ShareprefSave.token,
      // );
      // var refToken = await PrefsHelper.getString(
      //   ShareprefSave.refToken,
      // );
      //
      // if (isFirstTime.isEmpty && token.isEmpty && refToken.isEmpty) {
      //   print("1st");
      //   Get.offAll(const OnboardPage());
      // } else if (token.isEmpty && refToken.isEmpty) {
      //   print("2nd");
      //   Get.offAll(LoginScreen());
      // } else {
      //   print("3rd");
      //   print(await PrefsHelper.getString(
      //     ShareprefSave.isFirstTime,
      //   ));
      //   print(await PrefsHelper.getString(
      //     ShareprefSave.token,
      //   ));
      //   print(await PrefsHelper.getString(
      //     ShareprefSave.refToken,
      //   ));
      //
      //   ProfileController profileController = Get.put(ProfileController());
      //   await profileController.fetchProfile();
      //   Get.toNamed(homeScreen);
      //   CartData _cartDataController = Get.put(CartData());
      //   _cartDataController.getSavedata();
      }
    );
  }



}
