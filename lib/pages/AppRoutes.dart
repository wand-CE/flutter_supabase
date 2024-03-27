import 'package:flutter/material.dart';
import 'package:flutter_supabase/pages/forgotPassPage.dart';
import 'package:flutter_supabase/pages/homePage.dart';
import 'package:flutter_supabase/pages/signUpPage.dart';

import 'loginPage.dart';

class AppRoutes {
  static const homePage = '/homePage';
  static const signUpPage = '/signUpPage';
  static const loginPage = '/loginPage';
  static const forgotPassPage = '/forgotPassPage';

  static Map<String, WidgetBuilder> define() {
    return {
      homePage: (BuildContext context) => HomePage(),
      signUpPage: (BuildContext context) => SignUpPage(),
      loginPage: (BuildContext context) => LoginPage(),
      forgotPassPage: (BuildContext context) => ForgotPassPage(),
    };
  }
}
