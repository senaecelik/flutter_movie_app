import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/res/color.dart';
import 'package:flutter_application/res/style/text_style.dart';
import 'package:flutter_application/utils/routes/routes.dart';
import 'package:flutter_application/utils/routes/routes_name.dart';
import 'package:flutter_application/view_model/detail_view_model.dart';
import 'package:flutter_application/view_model/home_view_model.dart';
import 'package:flutter_application/view_model/person_detail_view_model.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization(null);
  HttpOverrides.global = MyHttpOverrides();

  runApp(const MyApp());
}

Future initialization(
    BuildContext? context) async {
  await Future.delayed(const Duration(seconds: 4));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => HomeViewViewModel()),
        ChangeNotifierProvider(
            create: (_) => DetailViewModel()),
        ChangeNotifierProvider<
                PersonDetailViewModel>.value(
            value: PersonDetailViewModel())
      ],
      child: MaterialApp(
        scrollBehavior: CustomScrollBehavior(),
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          primaryColor: AppColors.redColor,
          scaffoldBackgroundColor:
              AppColors.blackColor,

          appBarTheme: AppBarTheme(
              surfaceTintColor:
                  AppColors.whiteColor,
              scrolledUnderElevation: 2,
              toolbarTextStyle:
                  AppStyle.instance.bodyMedium,
              iconTheme: const IconThemeData(
                  color: AppColors.whiteColor),
              backgroundColor: Colors.transparent,
              elevation: 0),
          elevatedButtonTheme:
              ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                primary: AppColors.redColor,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(
                            30))),
          ),
          checkboxTheme: CheckboxThemeData(
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(5)),
              fillColor:
                  MaterialStateProperty.all(
                      AppColors.redColor)),
          //inputDecoration Theme
          inputDecorationTheme:
              InputDecorationTheme(
                  filled: true,
                  fillColor: AppColors.whiteColor
                      .withOpacity(0.1),
                  focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(
                              20.0),
                      borderSide: const BorderSide(
                          color: AppColors
                              .redColor)),
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(
                            20.0),
                  ),
                  hoverColor: AppColors.redColor,
                  contentPadding:
                      const EdgeInsets.all(20),
                  prefixIconColor: AppColors
                      .whiteColor
                      .withOpacity(0.4),
                  suffixIconColor: AppColors
                      .whiteColor
                      .withOpacity(0.4),
                  hintStyle: AppStyle
                      .instance.bodyMedium
                      .copyWith(
                          color: AppColors
                              .whiteColor
                              .withOpacity(0.4))),
        ),
        initialRoute: RoutesName.onboard,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}

class CustomScrollBehavior
    extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(
      SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host,
                  int port) =>
              true;
  }
}
