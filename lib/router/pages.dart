import 'package:catch_crack/Screen/Homepage.dart';
import 'package:catch_crack/auth/forgotpass/forgotpass_binding.dart';
import 'package:catch_crack/auth/forgotpass/forgotpass_screen.dart';
import 'package:catch_crack/router/router_name.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../Screen/On_Off.dart';
import '../auth/authcheck/authcheck_screen.dart';
import '../auth/login/login_binding.dart';
import '../auth/login/login_screen.dart';
import '../auth/signup/signup_binding.dart';
import '../auth/signup/signup_screen.dart';

class Pages {
  static List<GetPage> pages() {
    return [
      GetPage(
        name: RouterName.authcheck,
        page: () => const AuthCheckScreen(),
      ),
      GetPage(
        name: RouterName.login,
        page: () => const LoginScreen(),
        binding: LoginBinding(),
      ),
      GetPage(
        name: RouterName.signup,
        page: () => SignupScreen(),
        binding: SignupBinding(),
      ),
      // GetPage(
      //   name: RouterName.forgotpassword,
      //   page: () =>  ForgotpassScreen(),
      //   binding: ForgotpassBinding(),
      // ),
      GetPage(
        name: RouterName.home,
        page: () =>  HomePage(),
      ),


    ];
  }
}
