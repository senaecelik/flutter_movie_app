import 'package:flutter/material.dart';
import 'package:flutter_application/models/cast.dart';
import 'package:flutter_application/res/color.dart';
import 'package:flutter_application/res/componenets/avaible_circle_photo.dart';
import 'package:flutter_application/res/componenets/not_avaible_photo.dart';
import 'package:flutter_application/res/style/text_style.dart';
import 'package:flutter_application/view/person_detail/person_detail_screen.dart';

class CastItem extends StatelessWidget {
  final Casts cast;
  const CastItem({
    Key? key,
    required this.cast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width =
        MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    PersonDetailScreen(
                        person: cast)));
      },
      child: Card(
        color: AppColors.blackColor,
        elevation: 0,
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.center,
          crossAxisAlignment:
              CrossAxisAlignment.center,
          children: [
            cast.profilePath == null
                ? NotAvaiblePhoto(
                    height: 100,
                    width: 100,
                  )
                : AvaibleCirclePhoto(
                    imageUrl: cast.profilePath!,
                  ),
            cast.name == null
                ? Text("N/A")
                : Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    crossAxisAlignment:
                        CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            right: width * .05),
                        width: width * .20,
                        child: Column(
                          children: [
                            Text(
                              cast.name!,
                              style: AppStyle
                                  .instance
                                  .bodyXLarge,
                            ),
                          ],
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
                                .instance
                                .bodyMedium
                                .copyWith(
                              color: AppColors
                                  .whiteColor
                                  .withOpacity(
                                      0.4),
                            ),
                          )),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
