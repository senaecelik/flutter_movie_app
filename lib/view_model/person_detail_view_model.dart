import 'package:flutter/cupertino.dart';
import 'package:flutter_application/data/response/api_response.dart';
import 'package:flutter_application/models/movies.dart';
import 'package:flutter_application/models/person.dart';
import 'package:flutter_application/models/person_image.dart';
import 'package:flutter_application/repository/person_repository.dart';

class PersonDetailViewModel with ChangeNotifier {
  final _personRepo = PersonRepository();
  final _personMovieRepo = PersonRepository();
  final _personImageRepo = PersonRepository();


  ApiResponse<Person> personList =
      ApiResponse.loading();

  
  ApiResponse<Movies> personMoviesList =
      ApiResponse.loading();


  ApiResponse<PersonImage> personImageList =
      ApiResponse.loading();


  setPersonList(ApiResponse<Person> response) {
    personList = response;
    notifyListeners();
  }

  setPersonMoviesList(
      ApiResponse<Movies> response) {
    personMoviesList = response;
    notifyListeners();
  }
   setPersonImageList(
      ApiResponse<PersonImage> response) {
    personImageList = response;
    notifyListeners();
  }
  


  Future<void> fetchPersonListApi(
      int personId) async {
    await _personRepo.fetchPerson(personId).then(
        (value) {
      setPersonList(ApiResponse.completed(value));
    }).onError((error, stackTrace) =>
        setPersonList(
            ApiResponse.error(error.toString())));
  }


  Future<void> fetchPersonMovies(
      int personId) async {
    await _personMovieRepo
        .fetchPersonMovie(personId)
        .then((value) {
      setPersonMoviesList(ApiResponse.completed(value));
    }).onError((error, stackTrace) =>
            setPersonMoviesList(ApiResponse.error(
                error.toString())));
  }


    Future<void> fetchPersonImage(
      int personId) async {
    await _personImageRepo
        .fetchPersonImage(personId)
        .then((value) {
      setPersonImageList(ApiResponse.completed(value));
    }).onError((error, stackTrace) =>
            setPersonImageList(ApiResponse.error(
                error.toString())));
  }
}
