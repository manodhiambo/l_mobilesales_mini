class AuthService {
  static Future<bool> authenticate(String username, String password) async {
    await Future.delayed(Duration(seconds: 2));
    // Simulate checking credentials (replace this with actual API call logic)
    return username == 'user' && password == 'password123';
  }
}
