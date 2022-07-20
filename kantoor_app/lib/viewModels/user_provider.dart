import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:kantoor_app/models/user.dart';
import 'package:kantoor_app/services/user_api.dart';

enum UserState { none, loading, error }

class UserProvider extends ChangeNotifier {
  final UserApi userApi = UserApi();

  UserState _userState = UserState.none;
  UserState get userState => _userState;

  changeState(UserState state) {
    _userState = state;
    notifyListeners();
  }

  User? _user;
  User? get user => _user;

  Future<void> getUser(int id) async {
    try {
      changeState(UserState.loading);
      _user = await userApi.getUser(id);
      changeState(UserState.none);
    } catch (e) {
      if (e is DioError) {
        changeState(UserState.error);
        debugPrint('bossss ${e.response!.statusCode.toString()}');
        debugPrint('bossss ${e.response!.data['message'].toString()}');
      } else {
        changeState(UserState.error);
        debugPrint('bossss ${e.toString()}');
      }
    }
  }

  Future<bool> editProfile(int id, User user) async {
    bool status = false;
    try {
      changeState(UserState.loading);
      await userApi.editProfile(id, user);
      status = true;
      changeState(UserState.none);
    } catch (e) {
      if (e is DioError) {
        changeState(UserState.error);
        debugPrint('bossss ${e.response!.statusCode.toString()}');
        debugPrint('bossss ${e.response!.data['message'].toString()}');
      } else {
        changeState(UserState.error);
        debugPrint('bossss ${e.toString()}');
      }
    }

    return status;
  }
}
