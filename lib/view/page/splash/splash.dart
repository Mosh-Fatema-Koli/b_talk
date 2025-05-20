import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'controller/splash_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _splashController = Get.put(SplashController());
    return Scaffold(
      body: Center(
        child: Image.asset("assets/App Welcome Screen.png",height: Get.height,width: Get.width,fit: BoxFit.cover,),
      ),
    );
  }
}
