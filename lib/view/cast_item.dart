import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application/models/cast.dart';
import 'package:flutter_application/res/color.dart';
import 'package:flutter_application/res/style/text_style.dart';

class CastItem extends StatelessWidget {
  final Casts cast;
  const CastItem({Key? key, required this.cast})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height =
        MediaQuery.of(context).size.height;
    final width =
        MediaQuery.of(context).size.width;
    return Card(
      color: AppColors.blackColor,
      elevation: 0,
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.start,
        children: [
          cast.profilePath == null
              ? Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.redColor),
                  child:
                      Center(child: Text("N/A")),
                )
              : Container(
                  margin:
                      EdgeInsets.only(right: 10),
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                            "https://image.tmdb.org/t/p/w500${cast.profilePath}",
                          ),
                          fit: BoxFit.cover)),
                ),
          cast.name == null
              ? Text("N/A")
              : Column(
                  mainAxisAlignment:
                      MainAxisAlignment.start,
                  crossAxisAlignment:
                      CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: height * .05,
                          right: width * .05),
                      width: width * .20,
                      child: Text(
                        cast.name!,
                        style: AppStyle
                            .instance.bodyXLarge,
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                            right: width * .05),
                        width: width * .20,
                        child: Text(
                          cast.character!
                              .toString(),
                          style: AppStyle
                              .instance.bodyMedium
                              .copyWith(
                            color: AppColors
                                .whiteColor
                                .withOpacity(0.4),
                          ),
                        )),
                  ],
                )
        ],
      ),
    );
  }
}
