import 'package:flutter/material.dart';
import 'package:l_mobilesales_mini/data/services/auth_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthController extends ChangeNotifier {
  bool _isAuthenticated = false;
  String? _username;
  final _storage = FlutterSecureStorage();

  bool get isAuthenticated => _isAuthenticated;
  String? get username => _username;

  Future<bool> login(String username, String password, bool rememberMe) async {
    bool isAuthenticated = await AuthService.authenticate(username, password);

    if (isAuthenticated) {
      _username = username;
      _isAuthenticated = true;
      if (rememberMe) {
        await _storage.write(key: 'username', value: username);
        await _storage.write(key: 'password', value: password);  // Handle password securely
      }
      notifyListeners();
    } else {
      _isAuthenticated = false;
      notifyListeners();
    }

    return isAuthenticated;
  }

  Future<void> logout() async {
    await _storage.delete(key: 'username');
    await _storage.delete(key: 'password');
    _isAuthenticated = false;
    _username = null;
    notifyListeners();
  }

  Future<void> checkAuthentication() async {
    String? storedUsername = await _storage.read(key: 'username');
    if (storedUsername != null) {
      _isAuthenticated = true;
      _username = storedUsername;
      notifyListeners();
    }
  }
}

