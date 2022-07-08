import 'package:flutter/material.dart';
import 'package:flutter_application/models/movies.dart';
import 'package:flutter_application/res/color.dart';
import 'package:flutter_application/view/detail_screen.dart';

class ListItem extends StatelessWidget {
  final Results movies;
  const ListItem({
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
        children: [
          Stack(children: [
            Container(
              margin: EdgeInsets.only(right: 10),
              height: height * .35,
              width: width * .4,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(15),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://image.tmdb.org/t/p/w500${movies.posterPath}"))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 20),
              child: Container(
                height: height * .04,
                width: width * .10,
                decoration: BoxDecoration(
                  color: AppColors.redColor,
                  borderRadius:
                      BorderRadius.circular(5),
                ),
                child: Center(
                    child: Text(
                  "${movies.voteAverage!.roundToDouble()}",
                  style: TextStyle(
                    color: AppColors.whiteColor,
                  ),
                )),
              ),
            )
          ]),
        ],
      ),
    );
  }
}
