import 'package:btalk/api_client/app_chase.dart';
import 'package:btalk/utils/colors.dart';
import 'package:btalk/view/page/profile/allProfile/edit_profile.dart';
import 'package:btalk/view/page/profile/find_near_by/find_near_by.dart';
import 'package:btalk/view/page/profile/help/help.dart';
import 'package:btalk/view/page/profile/invite_friend/invite_friend.dart';
import 'package:btalk/view/page/profile/notification/notification.dart';
import 'package:btalk/view/page/profile/settings/settings.dart';
import 'package:btalk/view/widgets/custom_appber.dart';
import 'package:btalk/view/widgets/k_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../api_client/constant.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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

              },Text: "Profile"),
              SizedBox(
                height: 10,
              ),
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
                      Container(
                        height: 100,
                        width: 100,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              imageUrl: "${Constant.imageUrl}${AppCache().userInfo!.profilePicture}",
                              fit: BoxFit.cover, // Cover to fill the circular space
                              placeholder: (context, url) => Center(
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) =>
                                  Image.asset("assets/man.png", fit: BoxFit.contain),
                            )),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey.shade300,
                        ),
                      ),
                      KText(text: AppCache().userInfo?.name,fontSize: 16.sp,fontWeight: FontWeight.bold,),
                      KText(text: AppCache().userInfo?.phoneNumber,fontSize: 12,),
                       GestureDetector(
                           onTap:() {
                             Get.to(EditPofilePage(userInfo: AppCache().userInfo!,));
                           } ,
                           child: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Icon(Icons.edit_outlined,size: 15,),
                           )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {

                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.colorButton2.withOpacity(.1),
                  ),
                  child: KText(text: "Log out",color: AppColors.colorButton2,),
                ),
              ),
              SizedBox(
                height: 30,
              ),

              Card(
                color: Colors.white,
                child: ListTile(
                  onTap: () {
                    Get.to(NotificationPage());
                  },
                  leading: Icon(Icons.notifications_none,color: AppColors.colorButton2,),
                  title :KText(text: "Notification") ,
                  trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 15,),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Card(
                color: Colors.white,
                child: ListTile(
                  leading: Icon(Icons.insert_invitation_rounded,color: AppColors.colorButton2,),
                  onTap: () {
                    Get.to(InvitePage());
                  },
                  title :KText(text: "Invite Friend") ,
                  trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 15,),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Card(
                color: Colors.white,
                child: ListTile(
                  onTap: () {
                    Get.to(FindNearByPage());
                  },
                  leading: Icon(Icons.my_location_sharp,color: AppColors.colorButton2,),
                  title :KText(text: "Find nearby people") ,
                  trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 15,),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Card(
                color: Colors.white,
                child: ListTile(
                  onTap: () {
                    Get.to(SettingsPage());
                  },
                  leading: Icon(Icons.settings,color: AppColors.colorButton2,),
                  title :KText(text: "Settings") ,
                  trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 15,),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Card(
                color: Colors.white,
                child: ListTile(
                  onTap: () {
                    Get.to(HelpPage());
                  },
                  leading: Icon(Icons.help_outline_outlined,color: AppColors.colorButton2,),
                  title :KText(text: "Help") ,
                  trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 15,),
                ),
              ),
              SizedBox(
                height: 20,
              ),
          
            ],
          ),
        ),
      ),
    );
  }

}
