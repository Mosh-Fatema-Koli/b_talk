import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../common_Controller/mis_controller.dart';
import '../../../utils/colors.dart';
import 'controller/nav_controller.dart';

class NavbarPage extends StatelessWidget {
  NavbarPage({super.key});

  final controller = Get.put(NavController());
  final MiscController _miscController = MiscController();
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, Object? result) async {
        if (didPop) {
          return;
        }
        await _miscController.showAppExitDialog(context: context);
      },
      child: Scaffold(

        body: Obx(() => controller.page[controller.selectedIndex.value]),

        bottomNavigationBar: Obx(() {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(.1),
                )
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GNav(
                    selectedIndex: controller.selectedIndex.value,
                    onTabChange: (index) async {
                      controller.selectedIndex.value = index;
                      controller.onItemTapped(index);
                    },
                    rippleColor: Colors.grey,
                    // tab button ripple color when pressed
                    haptic: true,
                    // haptic feedback
                    tabBorderRadius: 25,
                    tabActiveBorder: Border.all(
                        color: Colors.deepPurple.withOpacity(0.2), width: 0),
                    // tab button border
                    tabBorder: Border.all(color: Colors.transparent, width: 0),
                    // tab button border
                    tabShadow: const [],
                    // tab button shadow
                    curve: Curves.easeIn,
                    // tab animation curves
                    duration: const Duration(milliseconds: 300),
                    // tab animation duration
                    gap: 8,
                    // the tab button gap between icon and text
                    color: AppColors.colorButton2,
                    // unselected icon color
                    activeColor: AppColors.colorButton2,
                    // selected icon and text color
                    iconSize: Get.height / 28,
                    // tab button icon size
                    tabBackgroundColor: AppColors.colorButton2.withOpacity(.1),
                    // selected tab background color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),
                    // navigation bar padding
                    tabs: [
                      GButton(
                        padding: EdgeInsets.all(8),
                        icon: Icons.chat,
                        text: 'Chat',
                      ),
                      GButton(
                        padding: EdgeInsets.all(8),
                        icon: Icons.note,
                        text: 'Update'.tr,
                      ),
                      GButton(
                        padding: EdgeInsets.all(8),
                        icon: Icons.group,
                        text: 'Contact',
                      ),
                      GButton(
                        padding: EdgeInsets.all(8),
                        icon: Icons.call,
                        text: 'Call',
                      ),
                    ]),
              ),
            ),
          );
        }),
      ),
    );
  }
}
