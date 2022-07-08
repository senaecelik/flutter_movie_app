import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application/models/cast.dart';
import 'package:flutter_application/models/review.dart';
import 'package:flutter_application/res/color.dart';
import 'package:flutter_application/res/style/text_style.dart';

class ReviewItem extends StatelessWidget {
  final Review review;
  ReviewItem({Key? key, required this.review})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height =
        MediaQuery.of(context).size.height;
    final width =
        MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment:
              MainAxisAlignment.start,
          crossAxisAlignment:
              CrossAxisAlignment.center,
          children: [
            review.authorDetails?.avatarPath ==
                    null
                ? Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            AppColors.redColor),
                    child: Center(
                        child: Text("N/A")),
                  )
                : Container(
                    margin: EdgeInsets.only(
                        right: 10),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                              "https://image.tmdb.org/t/p/w500${review.authorDetails!.avatarPath}",
                            ),
                            fit: BoxFit.cover)),
                  ),
            SizedBox(
              width: width * .02,
            ),
            review.authorDetails!.name == null
                ? Text("N/A")
                : Column(
                    mainAxisAlignment:
                        MainAxisAlignment.start,
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          review.authorDetails!
                              .username!,
                          style: AppStyle.instance
                              .bodyXLarge,
                        ),
                      ),
                    ],
                  )
          ],
        ),
        SizedBox(
          height: height * .02,
        ),
        Container(
            child: Text(
          review.content.toString(),
          style: AppStyle.instance.bodyMedium
              .copyWith(
            color: AppColors.whiteColor
                .withOpacity(0.4),
          ),
        )),
        Divider(
          color: AppColors.whiteColor
              .withOpacity(0.4),
        )
      ],
    );
  }
}
