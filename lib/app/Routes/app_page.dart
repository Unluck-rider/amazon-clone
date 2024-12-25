
import 'package:flutter/cupertino.dart';

import '../Screens/Login/Forgot Password.dart';
import '../Screens/Login/Login.dart';
import '../Screens/SplashScreen.dart';
import 'app_route.dart';

class ApPages {

  static const initialRoute = Routes.homeRoute;

  static Map<String, WidgetBuilder> routes = {
    Routes.homeRoute: (context)=>const Splashscreen(),
    Routes.LoginScreenRoute: (context)=>const LoginScreen(),
    Routes.ForgotPasswordRoute: (context)=>const ForgotPassword(),

  };

}