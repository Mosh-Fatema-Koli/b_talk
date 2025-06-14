import 'package:btalk/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../widgets/backButton.dart';
import '../../../widgets/custom_appber.dart';
import '../../../widgets/framework/RFRichText.dart';
import '../../../widgets/RFText.dart';
import 'controller/notification_controller.dart';

class NotificationPage extends StatelessWidget {
  NotificationPage({super.key});

  final NotificationController controller = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(onTap: () => Get.back()),
        title: const RFRichText(text: "Notification", isMandatory: false),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildNotificationTile(
                title: "Conversation tone",
                description:
                "Lorem ipsum dolor sit amet consectetur. Hac phasellus pulvinar convallis dignissim. Mi cras cras nam id nibh libero nunc sed.",
                switchValue: controller.isSwitchedConversation,
                switchType: "Conversation",
              ),
              _buildNotificationTile(
                title: "Message Alert",
                description:
                "Enable this to get notified when someone messages you directly.",
                switchValue: controller.isSwitchedMessage,
                switchType: "Message",
              ),
              _buildNotificationTile(
                title: "App Updates",
                description:
                "Stay informed about new features and updates to the app.",
                switchValue: controller.isSwitchedAppUpdates,
                switchType: "AppUpdates",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationTile({
    required String title,
    required String description,
    required RxBool switchValue,
    required String switchType,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RFText(text: title, fontSize: 16.sp),
                Obx(() => Switch(
                  value: switchValue.value,
                  activeColor: AppColors.primaryColor,
                  onChanged: (val) =>
                      controller.toggleSwitch(value: val, type: switchType),
                )),
              ],
            ),
            SizedBox(height: 4.h),
            RFText(text: description, fontSize: 12.sp),
          ],
        ),
      ),
    );
  }
}
