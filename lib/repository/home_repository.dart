import 'package:flutter_application/data/network/BaseApiServices.dart';
import 'package:flutter_application/data/network/NetworkApiServices.dart';
import 'package:flutter_application/models/movies.dart';
import 'package:flutter_application/res/app_url.dart';

class HomeRepository {
  final BaseApiServices _apiServices =
      NetworkApiServices();

  Future<Movies> getMovie() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(
              AppUrl.moviesPopularMovie);
      // print(response.body.toString());
      return response = Movies.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<Movies> getUpComingMovie() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(
              AppUrl.moviesUpComingMovie);
      // print(response.body.toString());
      return response = Movies.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<Movies> getTopRatedMovie() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(
              AppUrl.moviesTopRatedMovie);
      // print(response.body.toString());
      return response = Movies.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

 


}
