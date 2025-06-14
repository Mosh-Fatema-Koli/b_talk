import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/colors.dart';
import '../../widgets/RFText.dart';
import '../profile/allProfile/profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: RFText(
          text: "Newsfeed",
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
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
            SizedBox(height: 10),
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10, // Added itemCount for the builder
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey.shade400,
                    ),
                    child:ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                        child: Image.asset("assets/girl.jpg")),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(radius: 20),
                SizedBox(width: 10),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: const Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    height: 45,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.add),
                            SizedBox(width: 5),
                            RFText(text: "Create post"),
                          ],
                        ),
                        Icon(Icons.image_outlined),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  height: 300,
                  width: Get.width,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: const Offset(0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(),
                        title: RFText(text: "MR.XXXXXX"),
                        subtitle: RFText(text: "3:10pm"),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.share),
                        ),
                      ),
                      Container(
                        width: Get.width,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey.shade400,
                        ),
                        padding: EdgeInsets.all(5),
                        child: Icon(Icons.image),
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                              color: Colors.grey,
                              style: BorderStyle.solid,
                              width: 1),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.emoji_emotions_outlined),
                                SizedBox(width: 5),
                                RFText(text: "Say something"),
                              ],
                            ),
                            Icon(Icons.send),
                          ],
                        ),
                      ),
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
