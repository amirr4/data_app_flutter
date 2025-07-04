import 'package:http/http.dart' as http;
import 'http_service.dart';
import 'package:core/core.dart';

class HttpServiceImpl implements HttpService {
  final http.Client client;

  HttpServiceImpl({http.Client? client}) : client = client ?? http.Client();

  @override
  Future<http.Response> get(String url) async {
    final uri = Uri.parse('${ApiConstants.baseUrl}$url');
    return client.get(uri, headers: ApiConstants.defaultHeaders);
  }

  @override
  Future<http.Response> post(
    String url, {
    Map<String, String>? headers,
    Object? body,
  }) async {
    final uri = Uri.parse(url);
    return client.post(uri, headers: headers, body: body);
  }
}
