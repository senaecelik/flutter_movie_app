import 'package:flutter/material.dart';
import 'package:flutter_application/res/constant/string_constant.dart';
import 'package:flutter_application/view/home/popular_movie_list/popular_list_view.dart';
import 'package:flutter_application/view/home/top_rated_list/top_rated_list_view.dart';
import 'package:flutter_application/view/home/up_coming_list/up_coming_list_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() =>
      _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(AppString.instance.textAppName),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            PopularListView(),
            TopRatedListView(),
            UpComingListView()
          ],
        ),
      ),
    );
  }
}
