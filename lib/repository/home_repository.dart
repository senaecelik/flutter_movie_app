import 'dart:convert';

import 'package:flutter_application/data/network/BaseApiServices.dart';
import 'package:flutter_application/data/network/NetworkApiServices.dart';
import 'package:flutter_application/models/cast.dart';
import 'package:flutter_application/models/movies.dart';
import 'package:flutter_application/models/movies_video.dart';
import 'package:flutter_application/res/app_url.dart';
import 'package:http/http.dart' as http;

class HomeRepository {
  final BaseApiServices _apiServices =
      NetworkApiServices();
  final BaseApiServices _apiServices1 =
      NetworkApiServices();
  final BaseApiServices _apiServices2 =
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
          await _apiServices1.getGetApiResponse(
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
          await _apiServices2.getGetApiResponse(
              AppUrl.moviesTopRatedMovie);
      // print(response.body.toString());
      return response = Movies.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
//https://api.themoviedb.org/3/movie/{movie_id}/credits?api_key=<<api_key>>&language=en-US

  Future<Cast> fetchCasts(int movieId) async {
    final response = await http.get(Uri.parse(
        "${AppUrl.moviesBaseUrl}/$movieId/credits?api_key=${AppUrl.apiKey}"));
    print(response.body.toString());
    if (response.statusCode == 200) {
      return Cast.fromJson(
          json.decode(response.body));
    } else {
      throw Exception(
          'Failed to retrieve Movie Detail');
    }
  }

//https://api.themoviedb.org/3/movie/16/videos?api_key=0277cc714ad9100fe38b7f37fdfeb1d9

  Future<MoviesVideo> fetchMoviesVideo(
      int movieId) async {
    final response = await http.get(Uri.parse(
        "${AppUrl.moviesBaseUrl}/$movieId/videos?api_key=${AppUrl.apiKey}"));
    print(response.body.toString());
    if (response.statusCode == 200) {
      return MoviesVideo.fromJson(
          json.decode(response.body));
    } else {
      throw Exception(
          'Failed to retrieve Movie Detail');
    }
  }

  //https://api.themoviedb.org/3/movie/{movie_id}/similar?api_key=<<api_key>>&language=en-US&page=1



  Future<Movies> fetchSimilarMoviesVideo(
      int movieId) async {
    final response = await http.get(Uri.parse(
        "${AppUrl.moviesBaseUrl}/$movieId/similar?api_key=${AppUrl.apiKey}"));
    print(response.body.toString());
    if (response.statusCode == 200) {
      return Movies.fromJson(
          json.decode(response.body));
    } else {
      throw Exception(
          'Failed to retrieve Movie Detail');
    }
  }

}
