import 'package:flutter/material.dart';
import 'package:flutter_application/models/movies.dart';
import 'package:flutter_application/res/app_url.dart';
import 'package:flutter_application/res/color.dart';
import 'package:flutter_application/res/componenets/not_avaible_photo.dart';
import 'package:flutter_application/res/componenets/red_button.dart';
import 'package:flutter_application/res/componenets/white_border_button.dart';
import 'package:flutter_application/res/style/text_style.dart';
import 'package:flutter_application/view/detail/detail_screen.dart';

class PopularItem extends StatelessWidget {
  final Results movies;
  const PopularItem({
    Key? key,
    required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height =
        MediaQuery.of(context).size.height;
    final width =
        MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DetailPage(movies: movies)));
      },
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.start,
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Stack(
              alignment: Alignment.bottomLeft,
              children: [
                movies.posterPath == null
                    ? const NotAvaiblePhoto(height: 20, width: 20,)
                    : _moviePoster(height, width),
                _movieDetail(width, height),
              ]),
        ],
      ),
    );
  }

  Padding _movieDetail(
      double width, double height) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 20.0, horizontal: 20.0),
      child: Container(
        alignment: Alignment.centerLeft,
        width: width * .7,
        child: Column(
            mainAxisAlignment:
                MainAxisAlignment.start,
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              movies.title == null
                  ? const Text("N/A")
                  : _movieTitle(),
              SizedBox(
                height: height * .02,
              ),
              Row(
                  mainAxisAlignment:
                      MainAxisAlignment.start,
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    RedButton(
                        width: width,
                        height: height),
                    SizedBox(
                      width: width * .05,
                    ),
                    WhiteBorderButton(
                        width: width,
                        height: height),
                  ])
            ]),
      ),
    );
  }

  Text _movieTitle() {
    return Text(movies.title.toString(),
        style: AppStyle.instance.h5Bold.copyWith(
          color: AppColors.whiteColor,
        ));
  }

  Container _moviePoster(
      double height, double width) {
    return Container(
      height: height * .45,
      width: width,
      decoration: BoxDecoration(
          image: DecorationImage(
              filterQuality: FilterQuality.low,
              fit: BoxFit.cover,
              image: NetworkImage(
                  "${AppUrl.photoBaseUrl}${movies.posterPath}"))),
    );
  }
}
