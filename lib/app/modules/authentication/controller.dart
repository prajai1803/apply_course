
import 'package:apply_course/app/data/providers/firebase_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';




class AuthController extends GetxController {
  FirebaseProvider _firebaseProvider = FirebaseProvider();
  void googleSignIn() async{
    var success = await _firebaseProvider.signInWithGoogle();
    if(success){
      Get.offAllNamed('/appBase');
    }
  }
}