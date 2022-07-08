import 'package:flutter/material.dart';
import 'package:flutter_application/res/color.dart';
import 'package:flutter_application/utils/routes/routes.dart';
import 'package:flutter_application/utils/routes/routes_name.dart';
import 'package:flutter_application/view/login_view.dart';
import 'package:flutter_application/view_model/auth_view_model.dart';
import 'package:flutter_application/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthViewModel(),
        ),
        ChangeNotifierProvider(
            create: (_) => HomeViewViewModel())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.transparent,
              elevation: 0),
          scaffoldBackgroundColor:
              AppColors.blackColor,
        ),
        initialRoute: RoutesName.home,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
