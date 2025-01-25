import "package:flutter/material.dart";

import "../ui/login/widgets/login_screen.dart";
import "../ui/register/widgets/register_screen.dart";
import "../ui/car_list/widgets/car_list_screen.dart";

abstract final class AppRoutes {
  static const String login = "/login";
  static const String register = "/register";
  static const String carList = "/car-list";
  static const String home = "/home";
  static const String profile = "/profile";
  static const String pastRentals = "/profile/pastRentals";
}
