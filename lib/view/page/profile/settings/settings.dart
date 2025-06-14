
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../widgets/backButton.dart';
import '../../../widgets/custom_appber.dart';
import '../../../widgets/RFText.dart';
import '../../../widgets/framework/RFRichText.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(
            onTap: () => Get..back()),
        title: RFRichText(text: "Settings", isMandatory: false),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w,),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Card(
                color: Colors.white,
                child: ListTile(
                  leading: Icon(Icons.my_location_sharp),
                  title :RFText(text: "Change Number") ,
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
                  title :RFText(text: "Block") ,
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
                  title :RFText(text: "Delete Account") ,
                  trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 15,),
                ),
              ),

        Card(
          color: Colors.white,
          child: ListTile(
            leading: Icon(Icons.help_outline_outlined),
            title :RFText(text: "Help center") ,
            subtitle :RFText(text: "Get Help, Contact us",color: Colors.grey,) ,
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
            title :RFText(text: "Terms and privacy policy") ,
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
            title :RFText(text: "Channel reports") ,
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
            title :RFText(text: "App info") ,
            trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 15,),
          ),
        )
            ],
          ),
        ),
      ),
    );
  }
}
