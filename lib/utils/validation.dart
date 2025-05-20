import 'package:get/get_utils/src/get_utils/get_utils.dart';

class Validators {

  static String? phoneValidator(String? value) {
    if (value == "") {
      return "Please enter your phone number";
    }
    // else if (value?.length != 10) {
    //   return '';
    // }
    return null;
  }

  static String? emailValidator(String? value) {
    if (value == "") {
      return "Email is required";
    } else if (!GetUtils.isEmail(value!)) {
      return 'Please enter a valid email';
    }
    return null;
  }
  static String? nameValidator(String? value) {
    if (value == "") {
      return "Field could not empty";
    }
    return null;
  }
  static String? amountValidator(String? value) {
    if (value == "") {
      return "Field could not empty";
    }
    return null;
  }
}