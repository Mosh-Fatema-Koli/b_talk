import 'package:btalk/view/page/auth/controller/otp_controller.dart';
import 'package:btalk/view/page/auth/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../api_client/constant.dart';
import '../../../common_Controller/mis_controller.dart';
import '../../../utils/colors.dart';
import '../../widgets/button.dart';
import '../../widgets/framework/RFRichText.dart';


class OTPPage extends StatelessWidget {
  final String phoneNo;
  final TextEditingController pinController = TextEditingController();
  final MiscController _miscController = MiscController();
  final otpController = Get.put(OTPController());
  OTPPage({super.key, required this.phoneNo});

  static final defaultPinTheme = PinTheme(
    width: 56.w,
    height: 56.w,
    textStyle: TextStyle(
      fontSize: 20.sp,
      color: const Color.fromRGBO(30, 60, 87, 1),
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.primaryColor),
      borderRadius: BorderRadius.circular(20).w,
    ),
  );

  final focusedPinTheme = defaultPinTheme.copyDecorationWith(
    border: Border.all(color: AppColors.primaryColor),
    borderRadius: BorderRadius.circular(8).w,
  );

  final submittedPinTheme = defaultPinTheme.copyDecorationWith(
    color: AppColors.primaryColor,
  );

  @override
  Widget build(BuildContext context) {
    return  PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, Object? result) async {
        if (didPop) {
          return;
        }
        await _miscController.showAlertDialog(context: context, cancelable: false,title: "Close session",subTitle: "Do you want to close this session?",
            okPressed:(){
              _miscController.navigateTo(context: context,page: LogINPage());
            },okText: "Yes" ,cancelPressed:(){
              _miscController.navigateBack(context: context);
            },cancelText: "No");
      },
      child:  Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(20).w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RFRichText(
                  text: "OTP Verify",
                  size: 25.sp,
                  weight: FontWeight.bold, isMandatory: false,
                ),
                SizedBox(height: 15.h),
                RFRichText(
                  text: "Please check your email, enter your OTP",
                  size: 12.sp,
                  weight: FontWeight.normal,
                  color: AppColors.primaryColor, isMandatory: false,
                ),
                SizedBox(height: 20.h),
                Pinput(
                  length: 4,
                  controller: pinController,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  submittedPinTheme: submittedPinTheme,
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                  obscureText: true,
                ),
                SizedBox(height: 30.h),
                CustomButton(text: "Send OTP",
                  onPressed: () async {

                    if(pinController.text.isNotEmpty || pinController.length ==4 ){
                      SharedPreferences preference = await _miscController.pref();
                      String? Phone= await preference.get(Constant.userPhoneNo).toString();
                      otpController.otp(context: context, phone: Phone, pin: pinController.text, onComplete: (isSuccess, message) {

                      },);
                    }else{
                      _miscController.toast(msg: "Please Fill up all the fill");
                    }
                  },
                  buttonColor: Colors.grey,
                  buttonRadius: 50,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
