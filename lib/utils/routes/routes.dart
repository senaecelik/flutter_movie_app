import 'package:flutter/material.dart';
import 'package:flutter_application/utils/routes/routes_name.dart';
import 'package:flutter_application/view/auth/login_screen.dart';
import 'package:flutter_application/view/auth/register_screen.dart';
import 'package:flutter_application/view/home/home_screen.dart';
import 'package:flutter_application/view/onboard/onboard_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(
      RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.onboard:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                const OnboardScreen());

      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                const HomeScreen());

      case RoutesName.register:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                const RegisterScreen());

      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                const LoginScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
                child: Text('No route defined')),
          );
        });
    }
  }
}
