import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../widgets/RFText.dart';

class AudioCallPage extends StatelessWidget {
  const AudioCallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RFText(text: "Mosh fatema Koli"),
              RFText(text: "calling"),
            ],
          ),
        ),
        actions: [
          IconButton(onPressed: () {
          }, icon: Icon(Icons.group))
        ],
      ),
      body: Stack(
        children: [

          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                height: 100,
                width: 100,
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset("assets/girl.jpg"),
                ),
              ),
            ),),
          Positioned(
              bottom: 100,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    child: IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt_outlined)),
                  ),
                  Card(
                      child:
                      IconButton(onPressed: () {}, icon: Icon(Icons.mic))),
                  Card(
                      color: Colors.red,
                      child: IconButton(
                          onPressed: () {}, icon: Icon(Icons.call_end,color: Colors.white,)))
                ],
              ))

        ],
      ),

    );
  }
}
