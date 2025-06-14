import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../widgets/custom_appber.dart';
import '../../../widgets/RFText.dart';

class AfflictPage extends StatelessWidget {
  const AfflictPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w,),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              customAppBar(ontap: () {
                Get.back();
              },Text: "Afflict"),

              SizedBox(
                height: 10,
              ),


              ListTile(
                leading: Icon(Icons.settings),
                tileColor: Colors.white,
                title :RFText(text: "Delete settings") ,
                trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 15,),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
