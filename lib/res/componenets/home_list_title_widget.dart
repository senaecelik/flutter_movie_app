import 'package:flutter/material.dart';
import 'package:flutter_application/res/color.dart';
import 'package:flutter_application/res/style/text_style.dart';

class HomeListTittleWidget
    extends StatelessWidget {
  final String text;
  const HomeListTittleWidget(
      {Key? key, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: AppStyle.instance.h5Bold,
        ),
        Text("See all",
            style:
                AppStyle.instance.h5Bold.copyWith(
              color: AppColors.redColor,
            )),
      ],
    );
  }
}
