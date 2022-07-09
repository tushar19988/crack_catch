import 'package:catch_crack/auth/signup/signup_binding.dart';
import 'package:catch_crack/base/base_view_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends BaseView<SignupController> {
  // const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget vBuilder(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFFF99C87),
        title: Text('SignUp'),
      ),
      backgroundColor: Color(0XFFF99C87),
      resizeToAvoidBottomInset: true,
      body: Padding(
    padding: REdgeInsets.all(10.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Sign Up",
          style: TextStyle(color: Colors.white, fontSize: 30.sp),
        ),
        SizedBox(
          height: 50.h,
        ),
        TextFormField(
          controller: controller.name,
          textInputAction: TextInputAction.next,
          maxLines: 1,
          cursorColor: Colors.white,
          style: const TextStyle(color: Colors.white),
          keyboardType: TextInputType.text,
          autofocus: true,
          decoration: const InputDecoration(
              labelText: 'Name',
              labelStyle: TextStyle(color: Colors.white)),
        ),
        SizedBox(
          height: 30.h,
        ),
        TextFormField(
          controller: controller.email,
          textInputAction: TextInputAction.next,
          maxLines: 1,
          cursorColor: Colors.white,
          style: const TextStyle(color: Colors.white),
          keyboardType: TextInputType.emailAddress,
          autofocus: true,
          decoration: const InputDecoration(
              labelText: 'Email',
              labelStyle: TextStyle(color: Colors.white)),
        ),
        SizedBox(
          height: 30.h,
        ),
        TextFormField(
          controller: controller.pass,
          obscureText: !controller.passwordVisible,
          style: const TextStyle(color: Colors.white),
          textInputAction: TextInputAction.go,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            labelText: 'Password',
            labelStyle: const TextStyle(color: Colors.white),
            suffixIcon: IconButton(
              icon: Icon(
                controller.passwordVisible
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: Colors.white60,
              ),
              onPressed: () {
                controller.onPassvisible();
              },
            ),
          ),
        ),
        SizedBox(
          height: 50.h,
        ),
        RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r)),
            color: Colors.pink.shade300,
            onPressed: () async {
              await controller.signup();
            },
            child: Text(
              "Sign Up",
              style: TextStyle(fontSize: 16.sp, color: Colors.white),
            )),
      ],
    ),
      ),
    );
  }
}
