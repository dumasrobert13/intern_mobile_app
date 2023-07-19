import 'package:http/http.dart' as http;
import 'dart:convert';

class APIService {
  static Future<String> loginUserWithGoogle(String idToken) async {
    final url = Uri.parse('http://localhost:3000/google-signin');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({'idToken': idToken});

    final response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return responseData['customToken'];
    } else {
      throw Exception('Failed to authenticate with Google');
    }
  }

  static Future<String> loginUserWithFacebook(String accessToken) async {
    final url = Uri.parse('http://localhost:3000/facebook-signin');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({'accessToken': accessToken});

    final response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return responseData['customToken'];
    } else {
      throw Exception('Failed to authenticate with Facebook');
    }
  }
}
