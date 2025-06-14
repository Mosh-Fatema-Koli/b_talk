import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../utils/colors.dart';
import '../../../widgets/RFText.dart';
import '../../../widgets/backButton.dart';
import '../../../widgets/framework/RFRichText.dart';

class YourRequestPage extends StatelessWidget {
  const YourRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(
            onTap: () => Get.back()),
        title: RFRichText(text: "My Request", isMandatory: false),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w,),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListTile(
                    onTap: () {
                      //  Get.to(ChatDetailsPage());
                    },
                    contentPadding: EdgeInsets.zero,
                    leading: GestureDetector(
                      onTap: () {
                        // Get.dialog(Prodile_dialog());
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
                    title: RFText(text: "MR.XXXXXX"),
                    subtitle: RFText(text: "01302XXXXXXX"),
                    trailing: RFText(text: "Cancel Request",color: AppColors.colorButton2,fontSize: 12,),
                  ),
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
