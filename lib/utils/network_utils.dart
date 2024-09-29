import 'dart:async';
import 'package:http/http.dart' as http;

class InternetUtil {
  static Future<bool> hasInternetConnection({String url = 'https://www.google.com'}) async {
    try {
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 5));
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      return false;
    }
    return false;
  }
}