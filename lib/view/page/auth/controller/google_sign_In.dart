
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../bottom_Nav_Bar/navBar.dart';

class GoogleSignINController extends GetxController{

  final GoogleSignIn googleSignIn=GoogleSignIn();
  GoogleSignInAccount? googleAccount;

  signIn() async {
    try{
      googleAccount = await googleSignIn.signIn();
      update();
      Get.to(NavbarPage());// Notify UI to update
    }
    catch (error) {
      googleAccount = null;
      update();
    }
  }


  // Sign out
  Future<void> signOut() async {
    await googleSignIn.signOut();
    googleAccount = null;
    update();
  }

}