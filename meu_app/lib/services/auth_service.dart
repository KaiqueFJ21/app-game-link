import 'package:shared_preferences/shared_preferences.dart';

class AuthService {

  Future<bool> login(String email, String senha) async {
    await Future.delayed(const Duration(seconds: 1));

    // LOGIN FAKE
    if (email == "admin@gamelink.com" && senha == "123456") {

      final prefs = await SharedPreferences.getInstance();

      await prefs.setString("token", "fake_token_123");
      await prefs.setString("user_email", email);

      return true;
    }

    return false;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future<bool> isLogged() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("token") != null;
  }
}