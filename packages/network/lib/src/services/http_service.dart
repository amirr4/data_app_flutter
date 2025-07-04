import 'package:http/http.dart' as http;

abstract class HttpService {
  Future<http.Response> get(String url);
  Future<http.Response> post(String url, {Map<String, String>? headers, Object? body});
}
