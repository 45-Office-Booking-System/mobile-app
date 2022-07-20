import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:kantoor_app/models/gedung.dart';
import 'package:kantoor_app/services/gedung_api.dart';

enum GedungState { none, loading, error }

class GedungProvider extends ChangeNotifier {
  final GedungApi service = GedungApi();

  GedungState _gedungState = GedungState.none;
  GedungState get state => _gedungState;

  changeState(GedungState gedungState) {
    _gedungState = gedungState;
    notifyListeners();
  }

  Gedungs? _gedungs;
  Gedungs? get gedungs => _gedungs;

  Gedungs? _gedungById;
  Gedungs? get gedungById => _gedungById;

  clearData() {
    _gedungById = null;
  }

  Future<void> getAllGedung() async {
    changeState(GedungState.loading);
    try {
      _gedungs = await service.getAllGedung();
      changeState(GedungState.none);
    } catch (e) {
      changeState(GedungState.error);
      debugPrint('bossss ${e.toString()}');
    }
  }

  Future<void> getGedungById(int id) async {
    changeState(GedungState.loading);
    try {
      _gedungById = await service.getGedungById(id);
      changeState(GedungState.none);
    } catch (e) {
      if (e is DioError) {
        debugPrint('bossss ${e.response!.statusCode.toString()}');
      }
      changeState(GedungState.error);
      debugPrint('bossss ${e.toString()}');
    }
  }
}
