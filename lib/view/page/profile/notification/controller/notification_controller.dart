import 'package:get/get.dart';

class NotificationController extends GetxController {
  var isSwitchedConversation = false.obs;
  var isSwitchedMessage = false.obs;
  var isSwitchedAppUpdates = false.obs;

  void toggleSwitch({required bool value, required String type}) {
    switch (type) {
      case "Conversation":
        isSwitchedConversation.value = value;
        break;
      case "Message":
        isSwitchedMessage.value = value;
        break;
      case "AppUpdates":
        isSwitchedAppUpdates.value = value;
        break;
    }
  }
}
