import 'package:dio/dio.dart';
import 'package:kantoor_app/models/booking.dart';

class BookingApi {
  final Dio _dio = Dio();

  final String _baseUrl = 'https://officebooking-app-pn6n3.ondigitalocean.app/';

  Future<Booking> getBookingById(int id) async {
    try {
      final Response response = await _dio.get('${_baseUrl}customer/booking/$id');

      final booking = Booking.fromJson(response.data!);

      return booking;
    } catch (e) {
      rethrow;
    }
  }
}
