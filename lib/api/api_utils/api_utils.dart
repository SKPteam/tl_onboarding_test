import 'package:dio/dio.dart';

class ApiUtils {
  String? extractCookieFromHeaders(Headers headers) {
    final cookieList = headers["set-cookie"];
    if (cookieList == null || cookieList.isEmpty) return null;

    return cookieList.map((cookie) {
      final parts = cookie.split(";")[0].split("=");
      //final cookieName = parts[0];
      final cookieValue = parts[1];

      return cookieValue;
    }).join("; ");
  }
}
