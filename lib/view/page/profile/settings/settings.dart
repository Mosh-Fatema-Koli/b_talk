
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../widgets/custom_appber.dart';
import '../../../widgets/k_text.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

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
              },Text: "Settings"),
              SizedBox(
                height: 30,
              ),

              Card(
                color: Colors.white,
                child: ListTile(
                  onTap: () {
                    Get.to(SettingsPage());
                  },
                  leading: Icon(Icons.vpn_key_outlined),
                  title :KText(text: "Security notification") ,
                  trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 15,),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Card(
                color: Colors.white,
                child: ListTile(
                  leading: Icon(Icons.message),
                  title :KText(text: "Passkeys") ,
                  trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 15,),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Card(
                color: Colors.white,
                child: ListTile(
                  leading: Icon(Icons.notifications_none),
                  title :KText(text: "Add Email") ,
                  trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 15,),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Card(
                color: Colors.white,
                child: ListTile(
                  leading: Icon(Icons.insert_invitation),
                  title :KText(text: "Two step verification") ,
                  trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 15,),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Card(
                color: Colors.white,
                child: ListTile(
                  leading: Icon(Icons.my_location_sharp),
                  title :KText(text: "Change Number") ,
                  trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 15,),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Card(
                color: Colors.white,
                child: ListTile(
                  leading: Icon(Icons.block),
                  title :KText(text: "Block") ,
                  trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 15,),
                ),
              ),
              SizedBox(
                height: 5,
              ),

              Card(
                color: Colors.white,
                child: ListTile(
                  leading: Icon(Icons.delete),
                  title :KText(text: "Delete Account") ,
                  trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 15,),
                ),
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
