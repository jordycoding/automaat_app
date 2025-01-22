import "package:flutter/material.dart";

import "../ui/login/widgets/login_screen.dart";
import "../ui/register/widgets/register_screen.dart";
import "../ui/car_list/car_list_screen.dart";

class AppRoutes {
  static const String login = "/login";
  static const String register = "/register";
  static const String carList = "/car-list";

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      login: (context) => const LoginScreen(),
      register: (context) => const RegisterScreen(),
      carList: (context) => CarListScreen(),
    };
  }
}
