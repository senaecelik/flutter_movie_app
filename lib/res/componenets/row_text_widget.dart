import 'package:flutter/material.dart';
import 'package:flutter_application/res/componenets/text_button_red.dart';
import 'package:flutter_application/res/componenets/text_sub_widget.dart';

class RowTextWidget extends StatelessWidget {
  final void Function() onPress;
  final String text;
  final String clickText;
  const RowTextWidget(
      {Key? key,
      required this.onPress,
      required this.text,
      required this.clickText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment:
          CrossAxisAlignment.center,
      children: [
        TextSubWidget(text: text),
        const SizedBox(width: 4),
        TextButtonRed(
            onPress: onPress, text: clickText)
      ],
    );
  }
}
