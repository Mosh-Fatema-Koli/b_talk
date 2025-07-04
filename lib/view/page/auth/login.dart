import 'package:btalk/utils/colors.dart';
import 'package:btalk/view/page/auth/controller/login_controller.dart';
import 'package:btalk/view/page/auth/reg.dart';
import 'package:btalk/view/widgets/framework/RFRichText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../common_Controller/mis_controller.dart';
import '../../widgets/button.dart';
import '../../widgets/framework/RFTextField.dart';
import '../../widgets/RFText.dart';
import '../bottom_Nav_Bar/navBar.dart';
import 'controller/google_sign_In.dart';

class LogINPage extends StatelessWidget {
  LogINPage({super.key});

  final controller = Get.put(GoogleSignINController());
  final logInController = Get.put(LoginController());
  final MiscController _miscController = MiscController();

  TextEditingController phoneController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, Object? result) async {
        if (didPop) {
          return;
        }
        await _miscController.showAppExitDialog(context: context);
      },
      child: Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: [
            Center(child: RFText(text: "Login to BTalk",
              fontSize: 20,
              fontWeight: FontWeight.bold,)),
            SizedBox(
              height: 20.w,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Obx(() {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RFText(text: "Phone Number"),
                    SizedBox(
                      height: 5.w,
                    ),
                    RFTextField(controller: phoneController,
                      Picon: Icon(Icons.call, size: 18.w,),
                      hintText: "Enter your Phone Number",
                    ),
                    SizedBox(
                      height: 10.w,
                    ),
                    RFText(text: "Password"),
                    SizedBox(
                      height: 5.w,
                    ),
                    RFTextField(controller: passwordController,
                      Picon: Icon(Icons.lock, size: 18.w,),
                      hintText: "Enter your Password",),
                    SizedBox(
                      height: 20.w,
                    ),
                    RFText(text: "Forget Password?"),

                    SizedBox(
                      height: 30.w,
                    ),
                   logInController.isLoading.value==true?Center(
                     child: SizedBox(
                         height:30.h,
                         child: CircularProgressIndicator()),
                   ) :CustomButton(text: "Log In", onPressed: () {
                     if (phoneController.text.isNotEmpty && passwordController.text.isNotEmpty) {
                      logInController.login(username: phoneController.text, password: passwordController.text, isOnlineApp: true, isFromSplash: false, onLoginResult: (isSuccess, message) {
                      },);
                     } else {
                       _miscController.toast(msg: 'Please enter valid phone number and password',position: ToastGravity.BOTTOM);
                     }


                    }, buttonColor: Colors.grey, buttonRadius: 50,),
                    SizedBox(
                      height: 30.w,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(width: 10, height: 1, color: Colors.grey,),
                        SizedBox(width: 10.w,),
                        RFText(text: "OR"),
                        SizedBox(width: 10.w,),
                        Container(width: 10, height: 1, color: Colors.grey,),
                      ],
                    ),
                    SizedBox(
                      height: 30.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.signIn();
                      },
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 20,
                              child: Image.asset("assets/google.png", fit: BoxFit
                                  .cover,),),
                            RFRichText(text: "Google Login",isMandatory: false,)
                          ],
                        ),

                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.colorButton2 ,width: 2,style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(30)
                        ),
                        width: Get.width,
                      ),
                    ),
                    SizedBox(
                      height: 200.w,
                    ),
                    GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RFText(text: "Don’t have an settings?"),
                          SizedBox(width: 5.w,),
                          RFText(text: "Sign Up", fontWeight: FontWeight.bold,)
                        ],),
                      onTap: () {
                        Get.to(RegistrationPage());
                      },
                    )
                  ],
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
