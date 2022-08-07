import 'package:flutter_application/data/network/BaseApiServices.dart';
import 'package:flutter_application/data/network/NetworkApiServices.dart';
import 'package:flutter_application/models/person.dart';
import 'package:flutter_application/models/person_image.dart';
import 'package:flutter_application/res/app_url.dart';

import '../models/movies.dart';

class PersonRepository {
  final BaseApiServices _apiServices =
      NetworkApiServices();

  Future<Person> fetchPerson(int personId) async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(
              "${AppUrl.personBaseUrl}/$personId${AppUrl.personDetail}");

      return response = Person.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<Movies> fetchPersonMovie(
      int personId) async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(
              "${AppUrl.personBaseUrl}/$personId${AppUrl.movieCredits}");

      return response =
          Movies.fromPersonMovieJson(response);
    } catch (e) {
      rethrow;
    }
  }



  Future<PersonImage> fetchPersonImage(int personId) async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(
              "${AppUrl.personBaseUrl}/$personId${AppUrl.personImage}");

      return response = PersonImage.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
