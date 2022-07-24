import 'package:flutter/material.dart';
import 'package:flutter_application/data/response/status.dart';
import 'package:flutter_application/res/style/text_style.dart';
import 'package:flutter_application/view/home/up_coming_list/movie_list_item.dart';
import 'package:flutter_application/view_model/person_detail_view_model.dart';
import 'package:provider/provider.dart';

import '../../models/cast.dart';
import '../../res/color.dart';

class PersonMovieList extends StatefulWidget {
  Casts person;
  PersonMovieList(
      {Key? key, required this.person})
      : super(key: key);

  @override
  State<PersonMovieList> createState() =>
      _PersonMovieListState();
}

class _PersonMovieListState
    extends State<PersonMovieList> {
  PersonDetailViewModel personDetailViewModel =
      PersonDetailViewModel();

  @override
  void initState() {
    personDetailViewModel
        .fetchPersonMovies(widget.person.id!);
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
        Text("Movies",
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
                  value.personMoviesList.status) {
                case Status.LOADING:
                  return Container(
                    height: height,
                    child: const Center(
                        child:
                            CircularProgressIndicator()),
                  );
                case Status.ERROR:
                  return Text(value
                      .personMoviesList
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

  SizedBox _upComingMovieList(double height,
      PersonDetailViewModel value) {
    return SizedBox(
      height: height * .4,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: value.personMoviesList.data!
              .personMovie!.length,
          itemBuilder: (context, index) {
            return ListItem(
                movies: value.personMoviesList
                    .data!.personMovie![index]);
          }),
    );
  }
}
