import "package:flutter/material.dart";

import "../ui/login/widgets/login_screen.dart";
import "../ui/register/widgets/register_screen.dart";

class AppRoutes {
  static const String login = "/login";
  static const String register = "/register";

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      login: (context) => const LoginScreen(),
      register: (context) => const RegisterScreen(),
    };
  }
}
