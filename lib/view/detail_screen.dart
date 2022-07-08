import 'package:flutter/material.dart';
import 'package:flutter_application/models/movies.dart';
import 'package:flutter_application/models/movies_video.dart';
import 'package:flutter_application/res/color.dart';
import 'package:flutter_application/res/componenets/red_button.dart';
import 'package:flutter_application/res/style/text_style.dart';
import 'package:flutter_application/view/cast_list_view.dart';
import 'package:flutter_application/view/movie_video_list_view.dart';
import 'package:flutter_application/view/movie_video_trailer.dart';
import 'package:flutter_application/view/similar_movies_list_view.dart';
import 'package:flutter_application/view_model/detail_view_model.dart';

class DetailPage extends StatefulWidget {
  Results movies;
  DetailPage({Key? key, required this.movies})
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
        body: SingleChildScrollView(
      child: Column(
        children: [
          _moviePoster(height),
          SizedBox(
            height: height * .03,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 20),
            child: Column(
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
                DefaultTabController(
                  length: 3, // length of tabs
                  initialIndex: 0,
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment
                            .stretch,
                    children: [
                      Container(
                        child: TabBar(
                          indicatorColor:
                              AppColors.redColor,
                          labelColor:
                              AppColors.redColor,
                          unselectedLabelColor:
                              AppColors.whiteColor
                                  .withOpacity(
                                      0.4),
                          tabs: [
                            Tab(text: 'Videos'),
                            Tab(
                                text:
                                    'Similar Movies'),
                            Tab(text: 'Comment'),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(
                                bottom: 48.0),
                        child: Container(
                            height:
                                height, //height of TabBarView
                            decoration: BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        color: Colors
                                            .grey,
                                        width:
                                            0.5))),
                            child: TabBarView(
                                children: [
                                  MovieTrailerListView(
                                      movie: widget
                                          .movies),
                                  SimilarMovieListView(
                                      movie: widget
                                          .movies),
                                  Container(),
                                ])),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
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
      children: [
        Icon(
          Icons.star,
          color: AppColors.redColor,
          size: 18,
        ),
        SizedBox(
          width: width * .01,
        ),
        Text(widget.movies.voteAverage.toString(),
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

  Widget _upVideoList(
      double height, DetailViewModel value) {
    return SizedBox(
      height: height - 100,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: value
              .videoList.data!.results!.length,
          itemBuilder: (context, index) {
            return MovieVideoTrailer(
              video: value.videoList.data!
                  .results![index],
              movie: widget.movies,
            );
          }),
    );
  }

  Widget _moviePoster(double height) {
    return Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            height: height * .35,
            width: double.infinity,
            child: Image.network(
              "https://image.tmdb.org/t/p/w500${widget.movies.posterPath}",
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
}

class RedBorderWidget extends StatelessWidget {
  final String text;
  const RedBorderWidget(
      {Key? key, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color: AppColors.redColor,
              width: 2)),
      child: Text(text,
          style: AppStyle.instance.bodyMedium
              .copyWith(
                  color: AppColors.whiteColor)),
    );
  }
}
