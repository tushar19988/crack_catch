import 'package:catch_crack/base/base_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../../res/color.dart';

class ForgotpassBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgotpassController());
  }
}

class ForgotpassController extends BaseController {
  TextEditingController email = TextEditingController();
  String? user = FirebaseAuth.instance.currentUser?.email;

  @override
  void onInit() {
    email.text = user!;
    setScreenState = screenStateOk;
    update();
    super.onInit();
  }

  forgot() async {
    showLoadingDialog();
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email.text.trim());
      toastbar('Password Reset Email Send');
      Get.back();
      email.clear();
      update();
    } on FirebaseAuthException catch (e) {
      hideDialog();
      update();
      toastbar('Something went wrong');
    }
  }
}
