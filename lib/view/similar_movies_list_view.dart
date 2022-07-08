import 'package:flutter/material.dart';
import 'package:flutter_application/data/response/status.dart';
import 'package:flutter_application/res/style/text_style.dart';
import 'package:flutter_application/view/home/movie_list_item.dart';
import 'package:flutter_application/view_model/detail_view_model.dart';
import 'package:flutter_application/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

import '../../res/color.dart';
import '../models/movies.dart';

class SimilarMovieListView
    extends StatefulWidget {
  Results movie;
  SimilarMovieListView(
      {Key? key, required this.movie})
      : super(key: key);

  @override
  State<SimilarMovieListView> createState() =>
      _SimilarMovieListViewState();
}

class _SimilarMovieListViewState
    extends State<SimilarMovieListView> {
  DetailViewModel detailViewModel =
      DetailViewModel();

  @override
  void initState() {
    detailViewModel.fetchSimilarMovieListApi(
        widget.movie.id!);
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
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 20),
      child: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          crossAxisAlignment:
              CrossAxisAlignment.center,
          children: [
            ChangeNotifierProvider<
                    DetailViewModel>(
                create: (BuildContext context) =>
                    detailViewModel,
                child: Consumer<DetailViewModel>(
                    builder: (context, value, _) {
                  switch (value
                      .similarMovieList.status) {
                    case Status.LOADING:
                      return Center(
                          child:
                              CircularProgressIndicator());
                    case Status.ERROR:
                      return Text(value
                          .similarMovieList
                          .toString());
                    case Status.COMPLETED:
                      return Column(children: [
                        _upSimilarMovieList(
                            height, value)
                      ]);
                    default:
                      return Text("Hata");
                  }
                })),
          ],
        ),
      ),
    );
  }

  Widget _upSimilarMovieList(
      double height, DetailViewModel value) {
    return SizedBox(
      height: height,
      child: GridView.builder(
          shrinkWrap: true,
          gridDelegate:
              const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 250,
                  childAspectRatio: 2 / 3.5,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 0),
          itemCount: value.similarMovieList.data!
              .results!.length,
          itemBuilder: (context, index) {
            return ListItem(
                movies: value.similarMovieList
                    .data!.results![index]);
          }),
    );
  }
}

class HomeListTittleWidget
    extends StatelessWidget {
  final String text;
  const HomeListTittleWidget(
      {Key? key, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: AppStyle.instance.h5Bold,
        ),
        Text("See all",
            style:
                AppStyle.instance.h5Bold.copyWith(
              color: AppColors.redColor,
            )),
      ],
    );
  }
}
