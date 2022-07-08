import 'package:flutter/material.dart';
import 'package:flutter_application/data/response/status.dart';
import 'package:flutter_application/models/movies.dart';
import 'package:flutter_application/models/movies_video.dart';
import 'package:flutter_application/res/color.dart';
import 'package:flutter_application/view/movie_video_trailer.dart';
import 'package:flutter_application/view_model/detail_view_model.dart';
import 'package:provider/provider.dart';

class MovieTrailerListView
    extends StatefulWidget {
  Results movie;
  MovieTrailerListView(
      {Key? key, required this.movie})
      : super(key: key);

  @override
  State<MovieTrailerListView> createState() =>
      _MovieTrailerListViewState();
}

class _MovieTrailerListViewState
    extends State<MovieTrailerListView> {
  DetailViewModel detailViewModel =
      DetailViewModel();
  @override
  void initState() {
    detailViewModel
        .fetchVideoListApi(widget.movie.id!);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height =
        MediaQuery.of(context).size.height;

    return ChangeNotifierProvider<
            DetailViewModel>(
        create: (BuildContext context) =>
            detailViewModel,
        child: Consumer<DetailViewModel>(
            builder: (context, value, _) {
          switch (value.videoList.status) {
            case Status.LOADING:
              return Center(
                  child:
                      CircularProgressIndicator());
            case Status.ERROR:
              return Text(
                  value.videoList.toString());
            case Status.COMPLETED:
              return Column(children: [
                _upVideoList(value, height)
              ]);

            default:
              return const Text("Hata");
          }
        }));
  }

  Widget _upVideoList(
      DetailViewModel value, double height) {
    return SizedBox(
      height: height * 0.7,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: value
              .videoList.data!.results!.length,
          itemBuilder: (context, index) {
            return MovieVideoTrailer(
              video: value.videoList.data!
                  .results![index],
              movie: widget.movie,
            );
          }),
    );
  }
}
