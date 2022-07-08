import 'package:flutter/cupertino.dart';
import 'package:flutter_application/data/response/api_response.dart';
import 'package:flutter_application/models/cast.dart';
import 'package:flutter_application/models/movies.dart';
import 'package:flutter_application/models/movies_video.dart';
import 'package:flutter_application/models/review.dart';
import 'package:flutter_application/repository/home_repository.dart';

class DetailViewModel with ChangeNotifier {
  final _castRepo = HomeRepository();
  final _videoRepo = HomeRepository();
  final _similarMovieRepo = HomeRepository();
  final _reviewMovieRepo = HomeRepository();

  ApiResponse<Cast> castList =
      ApiResponse.loading();

  ApiResponse<MoviesVideo> videoList =
      ApiResponse.loading();

    ApiResponse<Movies> similarMovieList =
      ApiResponse.loading();

 ApiResponse<Reviews> reviewMovie =
      ApiResponse.loading();

  setCastList(ApiResponse<Cast> response) {
    castList = response;
    notifyListeners();
  }

  setVideoList(
      ApiResponse<MoviesVideo> response) {
    videoList = response;
    notifyListeners();
  }

  setSimilarList(
      ApiResponse<Movies> response) {
    similarMovieList = response;
    notifyListeners();
  }

  setReviewList(
      ApiResponse<Reviews> response) {
    reviewMovie = response;
    notifyListeners();
  }
  Future<void> fetchCastListApi(
      int movieId) async {
    await _castRepo
        .fetchCasts(movieId)
        .then((value) {
      setCastList(ApiResponse.completed(value));
    }).onError((error, stackTrace) => setCastList(
            ApiResponse.error(error.toString())));
  }

  Future<void> fetchVideoListApi(
      int movieId) async {
    await _videoRepo
        .fetchMoviesVideo(movieId)
        .then((value) {
      setVideoList(ApiResponse.completed(value));
    }).onError((error, stackTrace) =>
            setVideoList(ApiResponse.error(
                error.toString())));
  }
  
  Future<void> fetchSimilarMovieListApi(
      int movieId) async {
    await _similarMovieRepo
        .fetchSimilarMoviesVideo(movieId)
        .then((value) {
      setSimilarList(ApiResponse.completed(value));
    }).onError((error, stackTrace) =>
            setSimilarList(ApiResponse.error(
                error.toString())));
  }




 Future<void> fetchReviews(
      int movieId) async {
    await _castRepo
        .fetchReviewMovie(movieId)
        .then((value) {
      setReviewList(ApiResponse.completed(value));
    }).onError((error, stackTrace) => setReviewList(
            ApiResponse.error(error.toString())));
  }
}
