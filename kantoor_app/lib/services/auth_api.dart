import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:kantoor_app/models/login.dart';
import 'package:kantoor_app/models/register.dart';

class ApiService {
  final Dio _dio = Dio();

  final String _baseUrl = 'https://officebooking-app-pn6n3.ondigitalocean.app/';

  Future<Login?> login({required String email, required String password}) async {
    Login? login;

    try {
      Response response = await _dio.post(
        '${_baseUrl}login',
        data: {"email": email, "password": password},
      );

      login = Login.fromJson(response.data!);
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

    return login;
  }

  Future<bool?> register(Register register) async {
    bool? status;
    final data = Register.toJson(register);

    try {
      Response response = await _dio.post(
        '${_baseUrl}register',
        data: data,
      );

      debugPrint(response.data.toString());
      debugPrint(response.statusCode.toString());

      if (response.statusCode == 200) {
        status = true;
      }
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
    } catch (e) {
      throw e.toString();
    }

    return status;
  }
}
