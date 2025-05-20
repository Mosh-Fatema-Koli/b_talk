import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../widgets/custom_appber.dart';
import '../../../widgets/k_text.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

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
              },Text: "Help"),

              SizedBox(
                height: 5,
              ),


              Card(
                color: Colors.white,
                child: ListTile(
                  leading: Icon(Icons.help_outline_outlined),
                  title :KText(text: "Help center") ,
                  subtitle :KText(text: "Get Help, Contact us",color: Colors.grey,) ,
                  trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 15,),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Card(
                color: Colors.white,
                child: ListTile(
                  leading: Icon(Icons.privacy_tip),
                  title :KText(text: "Terms and privacy policy") ,
                  trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 15,),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Card(
                color: Colors.white,
                child: ListTile(
                  leading: Icon(Icons.bar_chart),
                  title :KText(text: "Channel reports") ,
                  trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 15,),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Card(
                color: Colors.white,
                child: ListTile(
                  leading: Icon(Icons.info),
                  title :KText(text: "App info") ,
                  trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 15,),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
