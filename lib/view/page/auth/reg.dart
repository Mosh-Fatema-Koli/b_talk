import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/button.dart';
import '../../widgets/framework/RFTextField.dart';
import '../../widgets/k_text.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Center(child: KText(text: "Create an Account",fontSize: 20,fontWeight: FontWeight.bold,)),
          SizedBox(
            height: 20.w,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                KText(text: "Name"),
                SizedBox(
                  height: 5.w,
                ),
                RFTextField(controller: null,
                  Picon: Icon(Icons.person,size: 18.w,),
                  hintText: "Enter your Phone Number",
                ),
                SizedBox(
                  height: 10.w,
                ),
                KText(text: "Phone Number"),
                SizedBox(
                  height: 5.w,
                ),
                RFTextField(controller: null,
                  Picon: Icon(Icons.call,size: 18.w,),
                  hintText: "Enter your Phone Number",
                ),
                SizedBox(
                  height: 10.w,
                ),
                KText(text: "Email"),
                SizedBox(
                  height: 5.w,
                ),
                RFTextField(controller: null,
                  Picon: Icon(Icons.email_sharp,size: 18.w,),
                  hintText: "Enter your Phone Number",
                ),
                SizedBox(
                  height: 10.w,
                ),
                KText(text: "Password"),
                SizedBox(
                  height: 5.w,
                ),
                RFTextField(controller: null,
                  Picon: Icon(Icons.lock,size: 18.w,),
                  hintText: "Enter your Password",),

                SizedBox(
                  height: 10.w,
                ),
                KText(text: "Confirm Password"),
                SizedBox(
                  height: 5.w,
                ),
                RFTextField(controller: null,
                  Picon: Icon(Icons.lock,size: 18.w,),
                  hintText: "Enter your Password",),

                SizedBox(
                  height: 30.w,
                ),
                RFButton(text: "Register", onPressed: (){},buttonColor: Colors.grey,buttonRadius: 50,),
                SizedBox(
                  height: 30.w,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(width: 10,height: 1,color: Colors.grey,),
                    SizedBox(width: 10.w,),
                    KText(text: "OR"),
                    SizedBox(width: 10.w,),
                    Container(width: 10,height: 1,color: Colors.grey,),
                  ],
                ),
                SizedBox(
                  height: 30.w,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,radius: 20,child: Image.asset("assets/google.png",fit: BoxFit.cover,),),
                    SizedBox(width: 10.w,),
                    CircleAvatar(backgroundColor: Colors.white,radius: 20,child: Image.asset("assets/facebook.png",fit: BoxFit.cover,),),
                  ],
                ),
                SizedBox(
                  height: 30.w,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    KText(text: "Already have an settings?"),
                    SizedBox(width: 5.w,),
                    KText(text: "Log In",fontWeight: FontWeight.bold,)
                  ],)
              ],
            ),
          )
        ],
      ),
    );
  }
}
