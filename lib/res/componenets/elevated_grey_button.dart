
import 'package:flutter/material.dart';
import 'package:flutter_application/res/color.dart';
import 'package:flutter_application/res/constant/string_constant.dart';

class ElevatedButtonGrey extends StatelessWidget {
  final Function() onPressed;
  const ElevatedButtonGrey(
      {Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height =
        MediaQuery.of(context).size.height;
    final width =
        MediaQuery.of(context).size.width;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: AppColors.whiteColor
              .withOpacity(0.2),
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: AppColors.whiteColor
                      .withOpacity(0.2)),
              borderRadius:
                  BorderRadius.circular(30))),
      onPressed: onPressed,
      child: SizedBox(
        height: height * .065,
        width: width,
        child: Center(
          child: Text(AppString
              .instance.textGoogleSignIn),
        ),
      ),
    );
  }
}
