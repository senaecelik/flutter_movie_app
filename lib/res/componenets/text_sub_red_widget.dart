
import 'package:flutter/material.dart';
import 'package:flutter_application/res/color.dart';
import 'package:flutter_application/res/style/text_style.dart';

class TextSubRedWidget extends StatelessWidget {
  final String text;
  const TextSubRedWidget(
      {Key? key, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style:
            AppStyle.instance.bodyMedium.copyWith(
          color:
              AppColors.redColor.withOpacity(0.8),
        ));
  }
}