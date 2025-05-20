import 'package:btalk/utils/colors.dart';
import 'package:btalk/view/page/auth/login.dart';
import 'package:btalk/view/widgets/k_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../auth/reg.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/logo.png",width: 119.w,),
            SizedBox(height: 30,),
            KText(text: "Welcome to bTalk!",fontSize: 26.sp,),
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap:(){
                    Get.to(LogINPage());
                  } ,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30,vertical: 8).w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color:AppColors.colorButton,width: 1,style: BorderStyle.solid),

                    ),
                    child: KText(text: "Log In",color:AppColors.colorButton,),
                  ),
                ),
                SizedBox(width: 10.w,),
                GestureDetector(

                    onTap:(){
                        Get.to(RegistrationPage());
                        } ,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30,vertical: 8).w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: AppColors.colorButton,width: 1,style: BorderStyle.solid),

                    ),
                    child: KText(text: "Sign Up",color: AppColors.colorButton,),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
