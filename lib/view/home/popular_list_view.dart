import 'package:flutter/material.dart';
import 'package:flutter_application/data/response/status.dart';
import 'package:flutter_application/view/home/popular_item.dart';
import 'package:flutter_application/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

class PopularListView extends StatefulWidget {
  const PopularListView({Key? key}) : super(key: key);

  @override
  State<PopularListView> createState() =>
      _PopularListViewState();
}

class _PopularListViewState
    extends State<PopularListView> {
  HomeViewViewModel homeViewViewModel =
      HomeViewViewModel();

  @override
  void initState() {
    homeViewViewModel.fetchMoviesListApi();
    super.initState();
  }

  @override
  void dispose() {
    homeViewViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height =
        MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment:
          CrossAxisAlignment.center,
      children: [
        ChangeNotifierProvider<HomeViewViewModel>(
            create: (BuildContext context) =>
                homeViewViewModel,
            child: Consumer<HomeViewViewModel>(
                builder: (context, value, _) {
              switch (value.moviesList.status) {
                case Status.ERROR:
                  return Text(value.moviesList
                      .toString());
                case Status.COMPLETED:
                  return Column(children: [
                    SizedBox(
                      height: height * .02,
                    ),
                    _popularMovieList(
                        height, value),
                  ]);
                default:
                  return Text("Hata");
              }
            })),
      ],
    );
  }

  Widget _popularMovieList(
      double height, HomeViewViewModel value) {
    return SizedBox(
      height: height * .47,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: value
              .moviesList.data!.results!.length,
          itemBuilder: (context, index) {
            return PopularItem(
                movies: value.moviesList.data!
                    .results![index]);
          }),
    );
  }
}
