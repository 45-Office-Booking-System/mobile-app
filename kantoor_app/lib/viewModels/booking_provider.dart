import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:kantoor_app/models/booking.dart';
import 'package:kantoor_app/services/booking_api.dart';

enum BookingAktifState { none, loading, error }

enum BookingSelesaiState { none, loading, error }

class BookingProvider extends ChangeNotifier {
  final BookingApi bookingApi = BookingApi();

  BookingAktifState _bookingAktifState = BookingAktifState.none;
  BookingAktifState get stateAktif => _bookingAktifState;

  BookingSelesaiState _bookingSelesaiState = BookingSelesaiState.none;
  BookingSelesaiState get stateSelesai => _bookingSelesaiState;

  changeAktifState(BookingAktifState bookingState) {
    _bookingAktifState = bookingState;
    notifyListeners();
  }

  changeSelesaiState(BookingSelesaiState bookingState) {
    _bookingSelesaiState = bookingState;
    notifyListeners();
  }

  String? _error;
  String? get error => _error;

  Booking? _bookingAktif;
  Booking? get bookingAktif => _bookingAktif;

  Booking? _bookingSelesai;
  Booking? get bookingSelesai => _bookingSelesai;

  Future<void> getBookingAktifById(int id) async {
    try {
      changeAktifState(BookingAktifState.loading);
      _bookingAktif = await bookingApi.getBookingById(id);
      changeAktifState(BookingAktifState.none);
    } catch (e) {
      if (e is DioError) {
        debugPrint('bossss ${e.response!.statusCode.toString()}');
        _error = e.response!.data['message'];
      }
      _error = 'Something went wrong';
      changeAktifState(BookingAktifState.error);
      debugPrint('bossss ${e.toString()}');
    }
  }

  Future<void> getBookingSelesaiById(int id) async {
    try {
      changeSelesaiState(BookingSelesaiState.loading);
      _bookingSelesai = await bookingApi.getBookingById(id);
      changeSelesaiState(BookingSelesaiState.none);
    } catch (e) {
      if (e is DioError) {
        debugPrint('bossss ${e.response!.statusCode.toString()}');
        _error = e.response!.data['message'];
      }
      _error = 'Something went wrong';
      changeSelesaiState(BookingSelesaiState.error);
      debugPrint('bossss ${e.toString()}');
    }
  }
}
