import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String baseUrl = "http://your-django-backend.com/api"; // Replace with your actual backend URL

  // Login method
  Future<bool> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/token/');
    final response = await http.post(
      url,
      body: {
        'email': email, // Or 'username' if your backend requires it
        'password': password,
        
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      String accessToken = data['access'];
      String refreshToken = data['refresh'];

      // Save tokens securely
      await _saveToken(accessToken, refreshToken);

      return true; // Login successful
    } else {
      return false; // Login failed
    }
  }

  // Register method
  Future<bool> register(String email, String password) async {
    final url = Uri.parse('$baseUrl/register/');
    final response = await http.post(
      url,
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 201) {
      return true; // Registration successful
    } else {
      return false; // Registration failed
    }
  }

  // Logout method
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('accessToken');
    await prefs.remove('refreshToken');
  }

  // Save token to local storage
  Future<void> _saveToken(String accessToken, String refreshToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('accessToken', accessToken);
    await prefs.setString('refreshToken', refreshToken);
  }

  // Retrieve saved token
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('accessToken');
  }

  // Check if user is authenticated
  Future<bool> isAuthenticated() async {
    final token = await getToken();
    return token != null;
  }
}
