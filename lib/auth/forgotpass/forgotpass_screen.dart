import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../base/base_view_view_model.dart';
import 'forgotpass_binding.dart';

class ForgotpassScreen extends BaseView<ForgotpassController> {

  @override
  Widget vBuilder(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0XFFF99C87),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.lock,
                    color: Colors.indigoAccent,
                    size: 100.h,
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "Forgot Password",
                style: TextStyle(fontSize: 24.sp),
              ),
              SizedBox(
                height: 50.h,
              ),
              TextFormField(
                controller: controller.email,
                cursorColor: Colors.indigoAccent,
                style: const TextStyle(color: Colors.black),
                keyboardType: TextInputType.none,
                decoration: const InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.indigoAccent)),
              ),
              SizedBox(
                height: 50.h,
              ),
              // RaisedButton(
              //   onPressed: () async {
              //     controller.forgot();
              //   },
              //   splashColor: Colors.green.shade100,
              //   shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(8.r)),
              //   color: Colors.white,
              //   child: const Text(
              //     "Reset password",
              //     style: TextStyle(color: Colors.indigoAccent),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    ));
  }
}
