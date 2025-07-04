import 'package:core/core.dart';
import 'package:network/src/services/http_service.dart';

class NetworkManager {
  final HttpService httpService;

  NetworkManager(this.httpService);

  Future<ApiResponse<String>> fetchData(String url) async {
    try {
      final response = await httpService.get(url);
      if (response.statusCode == 200) {
        print('Response Body: ${response.body}');
        return ApiResponse(data: response.body);
      } else {
        print('Status Code: ${response.statusCode}');
        return ApiResponse(error: 'خطای سرور: ${response.statusCode}');
      }
    } catch (e) {
      return ApiResponse(error: e.toString());
    }
  }
}
