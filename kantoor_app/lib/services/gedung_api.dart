import 'package:dio/dio.dart';
import 'package:kantoor_app/models/gedung.dart';

class GedungApi {
  final Dio _dio = Dio();

  final String _baseUrl = 'https://officebooking-app-pn6n3.ondigitalocean.app/';

  Future<Gedungs?> getAllGedung() async {
    Gedungs? gedungs;
    try {
      Response response = await _dio.get(
        '${_baseUrl}customer/gedungs',
      );

      gedungs = Gedungs.fromJson(response.data!);
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        throw "Wrong email or password";
      }
      if (e.type == DioErrorType.connectTimeout) {
        throw "Check your connection";
      }

      if (e.type == DioErrorType.receiveTimeout) {
        throw "Unable to connect to the server";
      }

      if (e.type == DioErrorType.other) {
        throw "Something went wrong";
      }
    }

    return gedungs;
  }

  Future<Gedungs?> getGedungById(int id) async {
    Gedungs? gedungs;
    try {
      Response response = await _dio.get(
        '${_baseUrl}customer/gedung/$id',
      );

      gedungs = Gedungs.fromJson(response.data!);
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        throw "Wrong email or password";
      }
      if (e.type == DioErrorType.connectTimeout) {
        throw "Check your connection";
      }

      if (e.type == DioErrorType.receiveTimeout) {
        throw "Unable to connect to the server";
      }

      if (e.type == DioErrorType.other) {
        throw "Something went wrong";
      }
    }

    return gedungs;
  }
}
