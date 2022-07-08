import 'package:flutter/material.dart';
import 'package:flutter_application/data/response/status.dart';
import 'package:flutter_application/models/movies.dart';
import 'package:flutter_application/view/home/popular_item.dart';
import 'package:flutter_application/view_model/detail_view_model.dart';
import 'package:flutter_application/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

import 'cast_item.dart';

class CastListView extends StatefulWidget {
  Results movie;
   CastListView({Key? key, required this.movie})
      : super(key: key);

  @override
  State<CastListView> createState() =>
      _CastListViewState();
}

class _CastListViewState
    extends State<CastListView> {
  DetailViewModel detailViewModel =
      DetailViewModel();

  @override
  void initState() {
    detailViewModel.fetchCastListApi(widget.movie.id!);
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
          switch (value.castList.status) {
            case Status.LOADING:
              return const CircularProgressIndicator();
            case Status.ERROR:
              return Text(
                  value.castList.toString());
            case Status.COMPLETED:
              return Column(children: [
                _upCastList(height, value)
              ]);
            default:
              return const Text("Hata");
          }
        }));
  }

 Widget _upCastList(
      double height, DetailViewModel value) {
    return SizedBox(
      height: height * .20,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: value
              .castList.data!.results!.length,
          itemBuilder: (context, index) {
            return CastItem(
                cast: value.castList.data!
                    .results![index]);
          }),
    );
  }
}
