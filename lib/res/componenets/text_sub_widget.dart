import 'package:flutter/material.dart';
import 'package:flutter_application/res/color.dart';
import 'package:flutter_application/res/style/text_style.dart';

class TextSubWidget extends StatelessWidget {
  final String text;
  const TextSubWidget(
      {Key? key, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        text,
        style:
            AppStyle.instance.bodyMedium.copyWith(
          color: AppColors.whiteColor
              .withOpacity(0.9),
        ),
      ),
    );
  }
}