import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:network/src/services/http_service.dart';

class NetworkManager {
  final HttpService httpService;

  NetworkManager(this.httpService);

  Future<ApiResponse<String>> fetchData(String url) async {
    try {
      final response = await httpService.get(url);
      if (response.statusCode == 200) {
        debugPrint('Response Body: ${response.body}');
        return ApiResponse(data: response.body);
      } else {
        debugPrint('Status Code: ${response.statusCode}');
        return ApiResponse(error: 'Status Code: ${response.statusCode}');
      }
    } catch (e) {
      return ApiResponse(error: e.toString());
    }
  }
}
