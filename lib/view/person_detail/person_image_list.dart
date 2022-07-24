import 'package:flutter/material.dart';
import 'package:flutter_application/res/app_url.dart';
import 'package:flutter_application/res/componenets/avaible_poster_path.dart';
import 'package:flutter_application/res/style/text_style.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:provider/provider.dart';

import '../../data/response/status.dart';
import '../../models/cast.dart';
import '../../res/color.dart';
import '../../view_model/person_detail_view_model.dart';

class PersonImageList extends StatefulWidget {
  Casts person;
  PersonImageList(
      {Key? key, required this.person})
      : super(key: key);

  @override
  State<PersonImageList> createState() =>
      _PersonImageListState();
}

class _PersonImageListState
    extends State<PersonImageList> {
  PersonDetailViewModel personDetailViewModel =
      PersonDetailViewModel();

  @override
  void initState() {
    personDetailViewModel
        .fetchPersonImage(widget.person.id!);
    super.initState();
  }

  @override
  void dispose() {
    personDetailViewModel.dispose();
    super.dispose();
  }

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
        Text("Images",
            style: AppStyle.instance.bodyXLarge
                .copyWith(
                    color: AppColors.redColor)),
        SizedBox(
          height: height * 0.02,
        ),
        ChangeNotifierProvider<
                PersonDetailViewModel>(
            create: (BuildContext context) =>
                personDetailViewModel,
            child:
                Consumer<PersonDetailViewModel>(
                    builder: (context, value, _) {
              switch (
                  value.personImageList.status) {
                case Status.LOADING:
                  return Container(
                    height: height,
                    child: const Center(
                        child:
                            CircularProgressIndicator()),
                  );
                case Status.ERROR:
                  return Text(value
                      .personImageList
                      .toString());
                case Status.COMPLETED:
                  return Column(children: [
                    _upComingMovieList(
                        height, value)
                  ]);
                default:
                  return const Text("Hata");
              }
            })),
      ],
    );
  }

  Widget _upComingMovieList(double height,
      PersonDetailViewModel value) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      height: height * 0.38,
      width: double.infinity,
      child: PhotoViewGallery.builder(
        itemCount: value.personImageList.data!
            .profiles!.length,
        builder: (context, index) {
          return PhotoViewGalleryPageOptions
              .customChild(
            minScale:
                PhotoViewComputedScale.contained *
                    1,
            maxScale:
                PhotoViewComputedScale.contained *
                    2,
            child: AvaiblePosterPath(
              height: 700,
              width: 500,
              imageUrl: value
                  .personImageList
                  .data!
                  .profiles![index]
                  .filePath!,
            ),
          );
        },
        scrollPhysics: BouncingScrollPhysics(),
        backgroundDecoration: BoxDecoration(
          color: AppColors.blackColor,
        ),
      ),
    );
  }
}
