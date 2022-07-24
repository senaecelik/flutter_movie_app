import 'package:flutter/material.dart';
import 'package:flutter_application/res/color.dart';

class NotAvaiblePhoto extends StatelessWidget {
  final double height;
  final double width;

  const NotAvaiblePhoto(
      {Key? key,
      required this.height,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.redColor),
      child: Center(child: Text("N/A")),
    );
  }
}
