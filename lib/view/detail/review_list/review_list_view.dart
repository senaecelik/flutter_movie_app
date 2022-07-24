import 'package:flutter/material.dart';
import 'package:flutter_application/data/response/status.dart';
import 'package:flutter_application/models/movies.dart';
import 'package:flutter_application/res/color.dart';
import 'package:flutter_application/res/style/text_style.dart';
import 'package:flutter_application/view/detail/review_list/review_list_item.dart';
import 'package:flutter_application/view_model/detail_view_model.dart';
import 'package:provider/provider.dart';

import '../cast_list/cast_item.dart';

class ReviewListView extends StatefulWidget {
  Results movie;
  ReviewListView({Key? key, required this.movie})
      : super(key: key);

  @override
  State<ReviewListView> createState() =>
      _ReviewListViewState();
}

class _ReviewListViewState
    extends State<ReviewListView> {
  DetailViewModel detailViewModel =
      DetailViewModel();

  @override
  void initState() {
    detailViewModel
        .fetchReviews(widget.movie.id!);
    super.initState();
  }

  @override
  void dispose() {
    detailViewModel.dispose();
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
          switch (value.reviewMovie.status) {
            case Status.LOADING:
              return Center(
                  child:
                      const CircularProgressIndicator());
            case Status.ERROR:
              return Text(
                  value.reviewMovie.toString());
            case Status.COMPLETED:
              return Column(children: [
                _upReviewMovieList(height, value)
              ]);
            default:
              return const Text("Hata");
          }
        }));
  }

  Widget _upReviewMovieList(
      double height, DetailViewModel value) {
    return SizedBox(
      height: height - 10,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: value
              .reviewMovie.data!.results!.length,
          itemBuilder: (context, index) {
            return value.reviewMovie.data!
                    .results!.isEmpty
                ? Text(
                    "Henüz yorum yok",
                    style: AppStyle
                        .instance.bodyMedium
                        .copyWith(
                            color: AppColors
                                .whiteColor
                                .withOpacity(
                                    0.4)),
                  )
                : ReviewItem(
                    review: value.reviewMovie
                        .data!.results![index]);
          }),
    );
  }
}
