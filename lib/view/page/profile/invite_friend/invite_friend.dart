import 'package:btalk/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../widgets/backButton.dart';
import '../../../widgets/custom_appber.dart';
import '../../../widgets/RFText.dart';
import '../../../widgets/framework/RFRichText.dart';
import '../../bottom_Nav_Bar/navBar.dart';
import 'invite_controller.dart';

class InvitePage extends StatelessWidget {
  InvitePage({super.key});

  final InviteFriendInfoController controller = Get.put(InviteFriendInfoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(
          onTap: () => Get..back()),
        title: RFRichText(text: "Invite Friend", isMandatory: false),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.contacts.isEmpty) {
          return const Center(child: Text("No contacts found"));
        }

        return ListView.builder(
          itemCount: controller.contacts.length,
          itemBuilder: (context, index) {
            final contact = controller.contacts[index];
            final phone = contact.phones.isNotEmpty
                ? contact.phones.first.number
                : 'No number';

            return ListTile(
              leading: const Icon(Icons.person),
              title: Text(contact.displayName),
              subtitle: Text(phone),
              trailing: IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {
                  // TODO: Add invite logic (e.g., open SMS or share link)
                  Get.snackbar("Invite", "Invitation sent to ${contact.displayName}");
                },
              ),
            );
          },
        );
      }),
    );
  }
}
