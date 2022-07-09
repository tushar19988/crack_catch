import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../base/base_view_view_model.dart';
import '../../router/router_name.dart';
import 'login_binding.dart';

class LoginScreen extends BaseView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget vBuilder(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFFF99C87),
        title: Text('Login'),
      ),
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0XFFF99C87),
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.all(10.0),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Sign In",
                  style: TextStyle(color: Colors.white, fontSize: 30.sp),
                ),
                SizedBox(
                  height: 50.h,
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
                  controller: controller.password,
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
                  height: 15.h,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     InkWell(
                //       splashColor: Colors.pink,
                //       child: const Text(
                //         "Forgot Password?",
                //         style: TextStyle(
                //           color: Colors.blue,
                //           decoration: TextDecoration.underline,
                //         ),
                //       ),
                //       onTap: () {
                //         Get.toNamed(RouterName.forgotpassword);
                //       },
                //     )
                //   ],
                // ),
                SizedBox(
                  height: 20.h,
                ),
                RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r)),
                    color: Colors.pink.shade300,
                    onPressed: () async {
                      await controller.login();
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 16.sp, color: Colors.white),
                    )),
                SizedBox(
                  height: 20.h,
                ),
                RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r)),
                    color: Colors.pink.shade300,
                    onPressed: () async {
                      await Get.toNamed(RouterName.signup);
                    },
                    child: Text(
                      "SignUp",
                      style: TextStyle(fontSize: 16.sp, color: Colors.white),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
