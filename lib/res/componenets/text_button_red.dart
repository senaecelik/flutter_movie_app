
import 'package:flutter/material.dart';
import 'package:flutter_application/res/componenets/text_sub_red_widget.dart';

class TextButtonRed extends StatelessWidget {
  final void Function()? onPress;
  final String text;
  const TextButtonRed(
      {Key? key,
      this.onPress,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPress,
        child: TextSubRedWidget(
          text: text,
        ));
  }
}