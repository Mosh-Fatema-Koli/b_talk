import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/colors.dart';
import '../../../widgets/k_text.dart';

Prodile_dialog() {
  return Stack(
    children: [
      Dialog(
        child: Stack(
          children: [
            Container(
              height: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment:
                CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                       color: AppColors.colorButton2,),
                    child: ClipRRect(
                      borderRadius:
                      BorderRadius.circular(100),
                      child: Image.asset("assets/girl.jpg"),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  KText(
                    text: "Mosh Fatema Koli",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  KText(
                    text: "01302XXXXXXX",
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    crossAxisAlignment:
                    CrossAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.call,
                            size: 20,
                            color: AppColors.colorButton2,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.mail,
                            size: 20,
                            color: AppColors.colorButton2,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.video_call_outlined,
                            size: 25,color: AppColors.colorButton2,
                          )),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
                top: 10,
                right: 10,
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.cancel,color: AppColors.colorButton,size: 22,)))
          ],
        ),
      ),
    ],
  );
}