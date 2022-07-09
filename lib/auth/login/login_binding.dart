import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../base/base_controller.dart';
import '../../res/color.dart';
import '../../router/router_name.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(), fenix: true);
  }
}

class LoginController extends BaseController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final storage = const FlutterSecureStorage();
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

  login() async {
    if (email.text.isEmpty) {
      toastbar("User name is required");
    } else if (password.text.isEmpty) {
      toastbar("Password is required");
    } else {
      try {
        showLoadingDialog();
        update();
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: email.text, password: password.text);
        await storage.write(key: "uid", value: userCredential.user?.uid);
        hideDialog();
        Get.toNamed(RouterName.home);
        email.clear();
        password.clear();
        update();
      } on FirebaseAuthException catch (e) {
        hideDialog();
        update();
        if (e.code == 'user-not-found') {
          toastbar('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          toastbar('Wrong password');
        } else if (e.code == 'network-request-failed') {
          toastbar('Check Internet Connection');
        } else {
          toastbar('Something went wrong');
        }
      }
    }
  }
}
