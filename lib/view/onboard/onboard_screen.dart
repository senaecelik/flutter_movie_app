import 'package:flutter/material.dart';
import 'package:flutter_application/res/color.dart';
import 'package:flutter_application/res/componenets/red_button.dart';
import 'package:flutter_application/res/style/text_style.dart';
import 'package:flutter_application/utils/routes/routes_name.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height =
        MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage(
                    "assets/onboard.png"))),
        child: Container(
          margin: EdgeInsets.only(bottom: 30),
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.end,
            children: [
              Text(
                "Welcome to Mova",
                style: AppStyle.instance.h2Bold,
              ),
              SizedBox(
                height: height * .02,
              ),
              Text(
                "The best movie streaming app of the century\n to make your days great!",
                style: AppStyle
                    .instance.bodyXLarge
                    .copyWith(
                        color: AppColors
                            .whiteColor
                            .withOpacity(0.5)),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: height * .02,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: AppColors.redColor,
                      fixedSize: Size(330, 50),
                      shape:
                          RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius
                                      .circular(
                                          30))),
                  onPressed: () {
                    Navigator.pushNamed(
                        context, RoutesName.home);
                  },
                  child: Text(
                    "Get Started",
                    style: AppStyle
                        .instance.bodyMedium,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
