import 'package:apply_course/app/data/models/course_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../core/values/keys.dart';
import '../models/user_model.dart';
import 'storage_provider.dart';

class FirebaseProvider {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final StorageProvider _storageProvider = StorageProvider();
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<bool> createCredentialWithEmail(
      String email, String displayName, String password) async {
    CollectionReference users = _firestore.collection(KeysConstant.users);
    try {
      UserCredential credential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      DocumentReference doc = users.doc(credential.user!.uid);
      await credential.user!.sendEmailVerification();
      UserModel userModel = UserModel(
        uid: credential.user!.uid,
        email: email,
        displayName: displayName,
      );
      await doc.set(userModel.toJson());
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar("Warning", "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar("Error", 'The account already exists for that email.');
      } else if (e.code == 'operation-not-allowed') {
        Get.snackbar("Error", 'There is a problem with auth service config');
      } else {
        Get.snackbar("Error", e.code);
      }
      return false;
    }
  }

  Future<bool> validateEmailVerification() async {
    _firebaseAuth.currentUser!.reload();
    if (_firebaseAuth.currentUser!.emailVerified) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> signInWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      if (!userCredential.user!.emailVerified) {
        userCredential.user!.sendEmailVerification();
      }
      UserModel userModel = UserModel(
        email: email,
        displayName: userCredential.user!.displayName ?? "",
        phoneNumber: userCredential.user!.phoneNumber ?? "",
        photoUrl: userCredential.user!.photoURL ?? "",
        uid: userCredential.user!.uid,
        emailVerified: userCredential.user!.emailVerified,
      );
      await _storageProvider.writeUserModel(userModel);
      printInfo(info: "Login SuccessFully");
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar("Warning", "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar("Error", 'The account already exists for that email.');
      } else if (e.code == 'operation-not-allowed') {
        Get.snackbar("Error", 'There is a problem with auth service config');
      } else {
        Get.snackbar("Error", e.code);
      }
      return false;
    }
  }

  Future<bool> signInWithGoogle() async {
    try {
      GoogleSignInAccount? user = await _googleSignIn.signIn();
      GoogleSignInAuthentication auth = await user!.authentication;
      CollectionReference users = _firestore.collection(KeysConstant.users);

      final cred = GoogleAuthProvider.credential(
          accessToken: auth.accessToken, idToken: auth.idToken);

      UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(cred);
      UserModel userModel = UserModel(
        email: userCredential.user!.email,
        displayName: userCredential.user!.displayName,
        phoneNumber: userCredential.user!.phoneNumber,
        photoUrl: userCredential.user!.photoURL,
        uid: userCredential.user!.uid,
        emailVerified: true,
      );
      if (userCredential.additionalUserInfo!.isNewUser) {
        await users.doc(userCredential.user!.uid).set(userModel.toJson());
        await _storageProvider.writeUserModel(userModel);
      } else {
        var res = await users.doc(userCredential.user!.uid).get();
        UserModel user = UserModel.fromJson(res.data() as Map<String, dynamic>);
        await _storageProvider.writeUserModel(user);
      }
      return true;
    } catch (e) {
      printInfo(info: e.toString());
      Get.snackbar("Error", e.toString());
      return false;
    }
  }

  Future<void> test() async {
    CollectionReference users = _firestore.collection(KeysConstant.users);
    var user = await users.doc("bCNhVWcddKcy8HadMt7ccAdg1CE2").get();
    var res = user.data();
    UserModel u = UserModel.fromJson(res as Map<String, dynamic>);
    print(u.additionalInformation!.contactName);
  }

  Future<bool> sendVerificationEmail() async {
    try {
      await _firebaseAuth.currentUser!.sendEmailVerification();
      printInfo(info: "Email send success fully");
      return true;
    } catch (e) {
      Get.snackbar("Error", e.toString());
      return false;
    }
  }

  Future<List<CourseModel>> getAllCourses() async {
    List<CourseModel> list = [];
    CollectionReference courses = _firestore.collection(KeysConstant.Courses);
    QuerySnapshot querySnapshot = await courses.get();
    final qurryList = querySnapshot.docs;
    list = qurryList
        .map((e) => CourseModel.fromJson(e.data() as Map<String, dynamic>))
        .toList();
    return list;
  }

  Future<bool> updateProfile(UserModel newUser) async {
    try {
      CollectionReference userCollection =
          _firestore.collection(KeysConstant.users);
      UserModel user = await _storageProvider.readUserModel();
      DocumentReference doc = userCollection.doc(user.uid);
      await doc.update(newUser.toJson());
      _storageProvider.writeUserModel(newUser);
      return true;
    } catch (e) {
      Get.snackbar("Error", e.toString());
      return false;
    }
  }

  Future<String> uploadImage(name, file) async {
    try {
      final ref = await _firebaseStorage
          .ref()
          .child('displayProfile/$name')
          .putFile(file);
      final url = await ref.ref.getDownloadURL();
      return url;
    } catch (e) {
      Get.snackbar("Error", e.toString());
      return 'null';
    }
  }
}
