import 'dart:io';

import 'package:btalk/utils/colors.dart';
import 'package:btalk/view/page/profile/allProfile/controller/edit_profile_controller.dart';
import 'package:btalk/view/widgets/framework/RFText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../api_client/app_chase.dart';
import '../../../../api_client/constant.dart';
import '../../../../common_Controller/mis_controller.dart';
import '../../../../common_model/UserInfo.dart';
import '../../../widgets/button.dart';
import '../../../widgets/framework/RFTextField.dart';
import '../../../widgets/framework/boxdecoration.dart';
import '../../../widgets/k_text.dart';

class EditPofilePage extends StatelessWidget {
  final UserInfo userInfo;

  final miscController = MiscController();
  EditPofilePage({super.key, required this.userInfo});

  final editController = Get.put(EditProfileController());
  final MiscController _miscController = MiscController();

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: userInfo.name ?? "");
    final emailController = TextEditingController(text: userInfo.email ?? "");

    return Scaffold(
      appBar: AppBar(
        title: RFText(text: "Edit Profile", isMandatory: false),
      ),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 50,vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        offset: const Offset(
                          5.0,
                          5.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ), //BoxShadow
                      BoxShadow(
                        color: Colors.white,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ), //BoxShadow
                    ],

                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          editController.selectImage();
                        },
                        child: Stack(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: editController.imagePath.value.isNotEmpty
                                      ? Image.file(
                                    File(editController.imagePath.value),
                                    fit: BoxFit.cover,
                                    width: 100.w,
                                    height: 100.h,
                                  )
                                      : AppCache().userInfo!.profilePicture !=null? CachedNetworkImage(
                                    imageUrl: "${Constant.imageUrl}${AppCache().userInfo!.profilePicture}",
                                    imageBuilder: (context, imageProvider) => Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                           ),
                                      ),
                                    ),
                                    placeholder: (context, url) => CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>   Image.asset(
                                      "assets/man.png",
                                      height: MediaQuery.of(context).size.height,
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.contain,
                                    ),
                                  ):
                                  Image.asset(
                                    "assets/man.png",
                                    height: MediaQuery.of(context).size.height,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.contain,
                                  ),),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.grey.shade300,
                              ),
                            ),
                        Positioned(
                            top: 5,
                            right: 5,
                            child:Icon(Icons.edit,size: 10,color: AppColors.primaryColor,))
                          ],
                        ),
                      ),
                      KText(text: AppCache().userInfo?.name,fontSize: 16.sp,fontWeight: FontWeight.bold,),
                      KText(text: AppCache().userInfo?.phoneNumber,fontSize: 12,),

                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.w,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildField("Name","Enter your name", nameController,),
                    _buildField("Email","Enter your email", emailController),

                    SizedBox(
                      height: 30.w,
                    ),
                    editController.isLoading.value == true ? Center(
                      child: SizedBox(
                          height: 30.h,
                          child: CircularProgressIndicator()),
                    ) : RFButton(text: "Update",
                      onPressed: () {
                        if (nameController.text.isNotEmpty &&
                            emailController.text.isNotEmpty
                           ) {
                          editController.updateProfile(context: context,
                            name: nameController.text,
                            email: emailController.text,
                            onComplete: (isSuccess, message) {

                            },);
                        } else {
                          _miscController.toast(
                              msg: "Please Fill up all the fill");
                        }
                      },
                      buttonColor: Colors.grey,
                      buttonRadius: 50,),
                    SizedBox(
                      height: 20.w,
                    ),

                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
   Widget _buildField(String name,String hint, TextEditingController controller, {bool readOnly = false}) {
     return Padding(
       padding: const EdgeInsets.symmetric( vertical: 5).w,
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           RFText(text: name,color: Colors.grey, isMandatory: false,),
           SizedBox(height: 10,),
           Container(
             decoration: RFBoxDecoration(border: Border.all(color: Colors.white,style: BorderStyle.solid,width: 2)).build(),
             child: Padding(
               padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5).w,
               child: TextField(
                 decoration: InputDecoration(
                   hintText: hint,
                   border: InputBorder.none,
                 ),
                 controller: controller,
                 readOnly: readOnly,
               ),
             ),
           ),
         ],
       ),
     );
   }
}