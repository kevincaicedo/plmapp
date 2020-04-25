import 'package:flutter/material.dart';
import 'package:plmapp/app/register/ui/screens/register_screen.dart';
import 'package:plmapp/app/welcome/ui/screens/welcome_screen.dart';

class Routes {
  static const main = '/';
  static const register = '/register';

  static Map<String, WidgetBuilder> getRoute() {
    return <String, WidgetBuilder>{
      main: (_) => const WelcomeScreen(),
      register: (_) => const RegisterScreen()
    };
  }
}
