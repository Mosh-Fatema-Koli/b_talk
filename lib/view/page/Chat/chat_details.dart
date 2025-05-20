import 'package:btalk/utils/colors.dart';
import 'package:btalk/view/widgets/framework/RFTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../widgets/k_text.dart';
import '../Call/audio_call.dart';
import '../Call/video_call.dart';
import 'comphonent/show_profile_dialog.dart';

class ChatDetailsPage extends StatelessWidget {
  const ChatDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller=TextEditingController();
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(onPressed: () {
              Get.back();
            },icon: Icon(Icons.arrow_back_ios),),
            Container(
              height: 40,
              width: 40,
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade300),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset("assets/girl.jpg"),
              ),
            ),
            SizedBox(width: 5,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                KText(
                  text: "Mosh Fatema Koli",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                KText(
                  text: "Online",
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ],
        ),

        actions: [
          GestureDetector(
            onTap: () {
              Get.to(AudioCallPage());
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.call),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.to(VideoCallPage());

            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.video_call),
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 15,bottom: 20,right: 15),
        child: Row(
          children: [
            Card(
                color:Colors.white,
                child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.emoji_emotions_outlined),
            )),
            SizedBox(width: 5,),
            Expanded(child: SizedBox(
              child: RFTextField(
                  radius: 30,
                  controller: _controller),
            )),
            SizedBox(width: 5,),
            Card(
                color:Colors.white,
                child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.mic),
            )),
          ],
        ),
      )

    );
  }
}
