import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/colors.dart';
import '../../widgets/framework/RFTextField.dart';
import '../../widgets/k_text.dart';
import '../Chat/comphonent/show_profile_dialog.dart';
import '../profile/profile.dart';

class ContactListPage extends StatelessWidget {
  const ContactListPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller=TextEditingController();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: KText(text: "Contact List",fontSize: 20,fontWeight: FontWeight.bold,),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [

            SizedBox(height: 10,),
            RFTextField(controller: controller,radius: 30,hintText: "Search",),
            SizedBox(height: 10,),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListTile(
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
                  subtitle:KText(text: "0168788689789"),

                ),
              ),)

          ],
        ),
      ),
    );
  }
}
