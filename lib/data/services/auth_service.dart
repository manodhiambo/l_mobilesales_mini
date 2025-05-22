class AuthService {
  static Future<bool> authenticate(String username, String password) async {
    await Future.delayed(Duration(seconds: 1)); // simulate network

    // Dummy login credentials
    return username == 'admin' && password == 'Admin@123';
  }
}
