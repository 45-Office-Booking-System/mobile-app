import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:kantoor_app/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserApi {
  final Dio _dio = Dio();

  final String _baseUrl = 'https://officebooking-app-pn6n3.ondigitalocean.app/';

  Future<User> getUser(int id) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      _dio.options.headers['authorization'] = "Bearer $token";
      Response response = await _dio.get(
        '${_baseUrl}customer/profile/$id',
      );

      final user = User.fromJson(response.data['data']);
      debugPrint(user.toString());

      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> editProfile(int id, User user) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      _dio.options.headers['authorization'] = "Bearer $token";
      Response response = await _dio.put(
        '${_baseUrl}customer/profile/$id',
        data: user.toJson(),
      );
    } catch (e) {
      rethrow;
    }
  }
}
