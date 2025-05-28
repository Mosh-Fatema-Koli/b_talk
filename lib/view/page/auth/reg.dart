import 'package:btalk/view/page/auth/controller/registration_controller.dart';
import 'package:btalk/view/page/auth/login.dart';
import 'package:btalk/view/page/auth/otp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../common_Controller/mis_controller.dart';
import '../../../utils/colors.dart';
import '../../widgets/button.dart';
import '../../widgets/framework/RFText.dart';
import '../../widgets/framework/RFTextField.dart';
import '../../widgets/k_text.dart';

class RegistrationPage extends StatelessWidget {
   RegistrationPage({super.key});

   final regController = Get.put(RegistrationController());
   final MiscController _miscController = MiscController();

   TextEditingController nameController=TextEditingController();
   TextEditingController phoneController=TextEditingController();
   TextEditingController emailController=TextEditingController();
   TextEditingController passwordController=TextEditingController();
   TextEditingController conPasswordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(() {
        return ListView(
          children: [
            Center(child: KText(text: "Create an Account",
              fontSize: 20,
              fontWeight: FontWeight.bold,)),
            SizedBox(
              height: 20.w,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  KText(text: "Name"),
                  SizedBox(
                    height: 5.w,
                  ),
                  RFTextField(controller: nameController,
                    Picon: Icon(Icons.person, size: 18.w,),
                    hintText: "Enter your Phone Number",
                  ),
                  SizedBox(
                    height: 10.w,
                  ),
                  KText(text: "Phone Number"),
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
                  KText(text: "Email"),
                  SizedBox(
                    height: 5.w,
                  ),
                  RFTextField(controller: emailController,
                    Picon: Icon(Icons.email_sharp, size: 18.w,),
                    hintText: "Enter your email",
                  ),
                  SizedBox(
                    height: 10.w,
                  ),
                  KText(text: "Password"),
                  SizedBox(
                    height: 5.w,
                  ),
                  RFTextField(controller: passwordController,
                    Picon: Icon(Icons.lock, size: 18.w,),
                    hintText: "Enter your Password",),

                  SizedBox(
                    height: 10.w,
                  ),
                  KText(text: "Confirm Password"),
                  SizedBox(
                    height: 5.w,
                  ),
                  RFTextField(controller: conPasswordController,
                    Picon: Icon(Icons.lock, size: 18.w,),
                    hintText: "Enter your Password",),

                  SizedBox(
                    height: 30.w,
                  ),
                  regController.isLoading.value==true?Center(
                    child: SizedBox(
                        height:30.h,
                        child: CircularProgressIndicator()),
                  ) : RFButton(text: "Register",
                    onPressed: () {
                    if(nameController.text.isNotEmpty &&
                        phoneController.text.isNotEmpty &&
                        emailController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty &&
                        conPasswordController.text.isNotEmpty ){
                       regController.registration(context: context,
                           name: nameController.text, 
                           phone: phoneController.text, 
                           email: emailController.text, 
                           password: passwordController.text,
                           confirmPassword: conPasswordController.text,
                           onComplete: (isSuccess, message) {
                             isSuccess==true?_miscController.navigateTo(context: context,page:OTPPage(phoneNo: passwordController.text,) ):_miscController.toast(msg: message);
                           },);
                    }else{
                      _miscController.toast(msg: "Please Fill up all the fill");
                    }
                    },
                    buttonColor: Colors.grey,
                    buttonRadius: 50,),
                  SizedBox(
                    height: 20.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(width: 10, height: 1, color: Colors.grey,),
                      SizedBox(width: 10.w,),
                      KText(text: "OR"),
                      SizedBox(width: 10.w,),
                      Container(width: 10, height: 1, color: Colors.grey,),
                    ],
                  ),
                  SizedBox(
                    height: 20.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      //controller.signIn();
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
                          RFText(text: "Google Login",isMandatory: false,)
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
                    height: 30.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      _miscController.navigateTo(context: context,page: LogINPage());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        KText(text: "Already have an settings?"),
                        SizedBox(width: 5.w,),
                        KText(text: "Log In", fontWeight: FontWeight.bold,)
                      ],),
                  )
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
