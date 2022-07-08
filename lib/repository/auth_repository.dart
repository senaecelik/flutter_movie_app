import 'package:flutter_application/data/network/BaseApiServices.dart';
import 'package:flutter_application/data/network/NetworkApiServices.dart';
import 'package:flutter_application/res/app_url.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.loginEndPint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

    Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.registerApiEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }



}
