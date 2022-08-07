// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application/models/movies.dart';
import 'package:flutter_application/res/app_url.dart';
import 'package:flutter_application/res/color.dart';
import 'package:flutter_application/res/componenets/red_border_widget.dart';
import 'package:flutter_application/res/componenets/red_button.dart';
import 'package:flutter_application/res/constant/string_constant.dart';
import 'package:flutter_application/res/style/text_style.dart';
import 'package:flutter_application/view/detail/cast_list/cast_list_view.dart';
import 'package:flutter_application/view/detail/video_list/movie_video_list_view.dart';
import 'package:flutter_application/view/detail/review_list/review_list_view.dart';
import 'package:flutter_application/view/detail/similar_movie_list/similar_movies_list_view.dart';

class DetailPage extends StatefulWidget {
  final Results movies;
  const DetailPage(
      {Key? key, required this.movies})
      : super(key: key);

  @override
  State<DetailPage> createState() =>
      _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final height =
        MediaQuery.of(context).size.height;
    final width =
        MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
            title: widget.movies.title != null
                ? Text("${widget.movies.title}")
                : Text(AppString
                    .instance.textAppName)),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _moviePoster(height),
              SizedBox(
                height: height * .03,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(
                        horizontal: 20),
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.start,
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    _moviesTitleRow(width),
                    SizedBox(
                      height: height * .02,
                    ),
                    _moviesDetailRow(width),
                    SizedBox(
                      height: height * .02,
                    ),
                    _moviesOverviewRow(),
                    CastListView(
                        movie: widget.movies),
                    _tabBar(height),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Stack _moviePoster(double height) {
    return Stack(
        alignment: Alignment.bottomLeft,
        children: [
          SizedBox(
            height: height * .35,
            width: double.infinity,
            child: Image.network(
              "${AppUrl.photoBaseUrl}${widget.movies.posterPath}",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 20.0, vertical: 20),
            child: RedButton(
                width: 500, height: 750),
          ),
        ]);
  }

  DefaultTabController _tabBar(double height) {
    return DefaultTabController(
      length: 3, // length of tabs
      initialIndex: 0,
      child: Column(
        children: [
          TabBar(
            indicatorColor: AppColors.redColor,
            labelColor: AppColors.redColor,
            unselectedLabelColor: AppColors
                .whiteColor
                .withOpacity(0.4),
            tabs: const [
              Tab(text: 'Videos'),
              Tab(text: 'Similar Movies'),
              Tab(text: 'Comment'),
            ],
          ),
          Container(
              height: height,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: Colors.grey,
                          width: 0.5))),
              child: TabBarView(children: [
                MovieTrailerListView(
                    movie: widget.movies),
                SimilarMovieListView(
                    movie: widget.movies),
                ReviewListView(
                    movie: widget.movies)
              ])),
        ],
      ),
    );
  }

  Text _moviesOverviewRow() {
    return Text(widget.movies.overview.toString(),
        style: AppStyle.instance.bodyXLarge
            .copyWith(
                color: AppColors.whiteColor));
  }

  Row _moviesDetailRow(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.star,
          color: AppColors.redColor,
          size: 18,
        ),
        SizedBox(
          width: width * .01,
        ),
        Text(
            widget.movies.voteAverage!
                .roundToDouble()
                .toString(),
            style: AppStyle.instance.bodyMedium
                .copyWith(
                    color: AppColors.redColor)),
        SizedBox(
          width: width * .01,
        ),
        Icon(
          Icons.arrow_forward_ios,
          color: AppColors.redColor,
          size: 18,
        ),
        Expanded(
          child: Text(
            widget.movies.releaseDate.toString(),
            style: AppStyle.instance.bodyMedium
                .copyWith(
                    color: AppColors.whiteColor),
          ),
        ),
        SizedBox(
          width: width * .04,
        ),
        RedBorderWidget(
            text: widget.movies.originalLanguage
                .toString()),
        SizedBox(
          width: width * .01,
        ),
        RedBorderWidget(
          text: widget.movies.adult == true
              ? "+18"
              : "+7",
        )
      ],
    );
  }

  Row _moviesTitleRow(double width) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: width * .50,
          child: Text(
            widget.movies.title.toString(),
            style: AppStyle.instance.h5Bold,
          ),
        ),
        Row(
          children: [
            Icon(
              Icons.bookmark_outline,
              color: AppColors.whiteColor,
            ),
            SizedBox(
              width: width * .02,
            ),
            Icon(
              Icons.send_outlined,
              color: AppColors.whiteColor,
            ),
          ],
        ),
      ],
    );
  }
}
