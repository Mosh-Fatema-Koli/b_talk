
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/colors.dart';
import '../../widgets/framework/RFTextField.dart';
import '../../widgets/k_text.dart';
import '../profile/allProfile/profile.dart';
import 'chat_details.dart';
import 'comphonent/show_profile_dialog.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image.asset("assets/logo.png", height: 22.h, fit: BoxFit.cover),
        actions: [
          Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.camera_alt_outlined,color: AppColors.colorButton2,size: 20,),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.to(ProfilePage());
            },
            child: Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.person_2_outlined,color: AppColors.colorButton2,size: 22,),
              ),
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            SizedBox(height: 5),
            RFTextField(controller: controller, radius: 30, hintText: "Search"),
            SizedBox(height: 10),
            ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListTile(
                  onTap: () {
                    Get.to(ChatDetailsPage());
                  },
                  contentPadding: EdgeInsets.zero,
                  leading: GestureDetector(
                    onTap: () {
                      Get.dialog(Prodile_dialog());
                    },
                    child: Container(
                      height: 45,
                      width: 45,
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade300),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset("assets/girl.jpg"),
                      ),
                    ),
                  ),
                  title: KText(text: "MR.XXXXXX"),
                  subtitle: KText(text: "text"),
                  trailing: Column(
                    children: [
                      CircleAvatar(
                        child: KText(text: "2"),
                        radius: 15,
                      ),
                      KText(text: "02:30 AM"),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
