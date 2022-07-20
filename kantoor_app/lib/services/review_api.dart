import 'package:dio/dio.dart';
import 'package:kantoor_app/models/post_review.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReviewApi {
  final Dio _dio = Dio();

  final String _baseUrl = 'https://officebooking-app-pn6n3.ondigitalocean.app/';

  Future<bool> postReview(PostReview review) async {
    final data = review.toJson();

    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // final token = prefs.getString('token');

    try {
      Response response = await _dio.post(
        '${_baseUrl}customer/review/',
        data: data,
      );

      if (response.statusCode == 401) {
        throw response.data['message'];
      }

      return true;
    } on DioError catch (e) {
      rethrow;
    }
  }
}
