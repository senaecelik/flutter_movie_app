import 'package:flutter/material.dart';
import 'package:flutter_application/data/response/status.dart';
import 'package:flutter_application/res/style/text_style.dart';
import 'package:flutter_application/view/home/movie_list_item.dart';
import 'package:flutter_application/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

import '../../res/color.dart';

class TopRatedListView extends StatefulWidget {
  TopRatedListView({Key? key}) : super(key: key);

  @override
  State<TopRatedListView> createState() =>
      _TopRatedListViewState();
}

class _TopRatedListViewState
    extends State<TopRatedListView> {
  HomeViewViewModel homeViewViewModel =
      HomeViewViewModel();

  @override
  void initState() {
    homeViewViewModel.fetchTopRateListApi();
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
                    HomeViewViewModel>(
                create: (BuildContext context) =>
                    homeViewViewModel,
                child:
                    Consumer<HomeViewViewModel>(
                        builder:
                            (context, value, _) {
                  switch (
                      value.topRatedList.status) {
                    case Status.LOADING:
                      return Center(
                          child:
                              CircularProgressIndicator());
                    case Status.ERROR:
                      return Text(value
                          .topRatedList
                          .toString());
                    case Status.COMPLETED:
                      return Column(children: [
                        HomeListTittleWidget(
                            text:
                                "Top Rated Film List"),
                        SizedBox(
                          height: height * .02,
                        ),
                        _upComingMovieList(
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

  SizedBox _upComingMovieList(
      double height, HomeViewViewModel value) {
    return SizedBox(
      height: height * .4,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: value
              .topRatedList.data!.results!.length,
          itemBuilder: (context, index) {
            return ListItem(
                movies: value.topRatedList.data!
                    .results![index]);
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
