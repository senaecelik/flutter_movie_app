import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/models/review.dart';
import 'package:flutter_application/res/app_url.dart';
import 'package:flutter_application/res/color.dart';
import 'package:flutter_application/res/componenets/avaible_circle_photo.dart';
import 'package:flutter_application/res/componenets/not_avaible_photo.dart';
import 'package:flutter_application/res/style/text_style.dart';

class ReviewItem extends StatelessWidget {
  final Review review;
  const ReviewItem({Key? key, required this.review})
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
                ? const NotAvaiblePhoto(
                    height: 50,
                    width: 50,
                  )
                : AvaibleReviewPhoto(
                    review: review),
            SizedBox(
              width: width * .02,
            ),
            review.authorDetails!.name == null
                ? const Text("N/A")
                : Column(
                    mainAxisAlignment:
                        MainAxisAlignment.start,
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        review.authorDetails!
                            .username!,
                        style: AppStyle.instance
                            .bodyXLarge,
                      ),
                    ],
                  )
          ],
        ),
        SizedBox(
          height: height * .02,
        ),
        Text(
          review.content.toString(),
          style: AppStyle.instance.bodyMedium
          .copyWith(
        color: AppColors.whiteColor
            .withOpacity(0.4),
          ),
        ),
        Divider(
          color: AppColors.whiteColor
              .withOpacity(0.4),
        )
      ],
    );
  }
}

class AvaibleReviewPhoto extends StatelessWidget {
  const AvaibleReviewPhoto({
    Key? key,
    required this.review,
  }) : super(key: key);

  final Review review;

  @override
  Widget build(BuildContext context) {
    return review.authorDetails!.avatarPath!
            .contains(AppUrl.photoBaseUrl)
        ? AvaibleCirclePhoto(
            imageUrl:
                review.authorDetails!.avatarPath!)
        : CachedNetworkImage(
            fit: BoxFit.cover,
            imageBuilder:
                (context, imageProvider) =>
                    Container(
              margin: const EdgeInsets.only(right: 10),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover),
              ),
            ),
            imageUrl:
                "https://www.gravatar.com/avatar/${review.authorDetails!.avatarPath}",
          );
  }
}
