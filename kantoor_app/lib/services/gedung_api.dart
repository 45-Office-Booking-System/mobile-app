import 'package:dio/dio.dart';
import 'package:kantoor_app/models/gedung.dart';

class GedungApi {
  final Dio _dio = Dio();

  final String _baseUrl = 'https://officebooking-app-pn6n3.ondigitalocean.app/';

  // Future<Gedung> getAllGedung() async {
  //   try {} catch (e) {}
  // }
}
