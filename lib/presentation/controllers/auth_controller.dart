import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:l_mobilesales_mini/data/services/auth_service.dart';

class AuthController extends ChangeNotifier {
  bool _isAuthenticated = false;
  String? _username;
  final _storage = FlutterSecureStorage();

  bool get isAuthenticated => _isAuthenticated;
  String? get username => _username;

  Future<bool> login(String username, String password, bool rememberMe) async {
    bool success = await AuthService.authenticate(username, password);

    if (success) {
      _username = username;
      _isAuthenticated = true;

      if (rememberMe) {
        await _storage.write(key: 'username', value: username);
        await _storage.write(key: 'password', value: password); // Encrypt this in production
      }
    } else {
      _isAuthenticated = false;
      _username = null;
    }

    notifyListeners();
    return success;
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
    String? storedPassword = await _storage.read(key: 'password');

    if (storedUsername != null && storedPassword != null) {
      bool success = await AuthService.authenticate(storedUsername, storedPassword);
      if (success) {
        _username = storedUsername;
        _isAuthenticated = true;
        notifyListeners();
      }
    }
  }
}
