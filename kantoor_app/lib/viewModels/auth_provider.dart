import 'package:flutter/foundation.dart';
import 'package:kantoor_app/models/register.dart';
import 'package:kantoor_app/services/auth_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthState { none, loading, error }

class AuthProvider extends ChangeNotifier {
  final ApiService service = ApiService();

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  AuthState _authState = AuthState.none;
  AuthState get state => _authState;

  changeState(AuthState authState) {
    _authState = authState;
    notifyListeners();
  }

  Future<void> login({required String email, required String password}) async {
    changeState(AuthState.loading);
    try {
      final loginRes = await service.login(email: email, password: password);
      if (loginRes != null) {
        final idUser = loginRes.idUser;
        final token = loginRes.token;

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setInt('idUser', idUser);
        await prefs.setString('token', token);
        await prefs.setString('expiryDate', DateTime.now().add(const Duration(days: 2)).toString());
      }
      changeState(AuthState.none);
    } catch (e) {
      changeState(AuthState.error);
      _errorMessage = e.toString();
      debugPrint('bossss ${e.toString()}');
    }
  }

  Future<String?> register({required Register register}) async {
    String? status;
    changeState(AuthState.loading);

    try {
      final registerRes = await service.register(register);

      if (registerRes != null) {
        if (registerRes) {
          status = "Register Successfully";
        } else {
          throw "Register Failed";
        }
      }
      changeState(AuthState.none);
    } catch (e) {
      changeState(AuthState.error);
      _errorMessage = e.toString();
    }

    return status;
  }
}
