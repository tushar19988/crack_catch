import 'dart:async';
import 'package:catch_crack/base/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../router/router_name.dart';

class AuthCheckScreen extends StatefulWidget {
  const AuthCheckScreen({Key? key}) : super(key: key);

  @override
  State<AuthCheckScreen> createState() => _AuthCheckScreenState();
}

class _AuthCheckScreenState extends State<AuthCheckScreen> {
  FlutterSecureStorage storagess = const FlutterSecureStorage();
  String? isLoggedIn;

  @override
  void initState() {
    super.initState();
    getUid();
  }

  getUid() async {
    var check = await storagess.read(key: "uid");
    isLoggedIn = check;
    print(">>>>> User ID  ${check.toString()}  >>>>> ");

    Timer(
      const Duration(seconds: 3),
      () {
        if (isLoggedIn != null) {
          Get.offNamed(RouterName.home);
        } else {
          Get.offNamed(RouterName.login);
        }
      },
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        color: Colors.black.withOpacity(0.3),
        child: Center(
          child: Wrap(
            children: [
              Container(
                padding: REdgeInsets.all(10.0),
                width: 100.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r)),
                child: const SpinKitFadingCircle(
                  color: Colors.blue,
                  size: 50.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
