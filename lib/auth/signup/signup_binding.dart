import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../../base/base_controller.dart';
import '../../db/db_helper.dart';
import '../../model/user_model.dart';
import '../../res/color.dart';
import '../../router/router_name.dart';

class SignupBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignupController());
  }
}

class SignupController extends BaseController {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  final storage = const FlutterSecureStorage();

  // final RegExp emailRegex = RegExp(
  //     r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  bool passwordVisible = false;

  @override
  void onInit() {
    setScreenState = screenStateOk;
    update();
    passwordVisible = false;
    super.onInit();
  }

  onPassvisible() {
    passwordVisible = !passwordVisible;
    update();
  }

  signup() async {
    if (email.text.isEmpty) {
      toastbar("User email is required");
    } else if (name.text.isEmpty) {
      toastbar('User name is required');
    } else if (name.text.length < 2) {
      toastbar('Enter valid name ');
    } else if (pass.text.isEmpty) {
      toastbar("Password is required");
    } else if (pass.text.length < 8) {
      toastbar("This password is too short."
          " It must contain at least 8 characters.");
    } else {
      try {
        showLoadingDialog();
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: email.text.trim(), password: pass.text.trim());
        await storage.write(key: "uid", value: userCredential.user?.uid);
        await DbHelp().adduser(UserModel(
          name: name.text.trim(),
          email: email.text.trim(),
          password: pass.text.trim(),
          uid: FirebaseAuth.instance.currentUser?.uid,
        ));
        print(
            "Data Name : ${name.text} \n Email: ${email.text}\n User Id : ${FirebaseAuth.instance.currentUser?.uid} \n Password : ${pass.text}");
        hideDialog();
        /// add home screen
        /// home screen
        Get.toNamed(RouterName.home);
        email.clear();
        pass.clear();
        name.clear();
        update();
      } on FirebaseAuthException catch (e) {
        hideDialog();
        update();
        if (e.code == 'weak-password') {
          toastbar('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          toastbar('The account already exists');
        } else if (e.code == 'network-request-failed') {
          toastbar('Check Internet Connection');
        } else if (e.code == 'invalid-email') {
          toastbar('Invalid Email');
        } else {
          print(e.code);
          toastbar('Something went wrong');
        }
      }
    }
  }
}
