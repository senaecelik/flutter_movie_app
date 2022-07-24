import 'package:flutter/material.dart';
import 'package:flutter_application/utils/routes/routes_name.dart';
import 'package:flutter_application/view/home/home_screen.dart';
import 'package:flutter_application/view/login_view.dart';
import 'package:flutter_application/view/onboard_screen.dart';
import 'package:flutter_application/view/person_detail_screen.dart';
import 'package:flutter_application/view/sign_up_view.dart';

class Routes {
  static Route<dynamic> generateRoute(
      RouteSettings settings) {
    final argument = settings.arguments;
    switch (settings.name) {
      case RoutesName.onboard:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                OnboardScreen());
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                LoginView());
      case RoutesName.signUp:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                const SignUpView());


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
