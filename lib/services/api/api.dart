import 'package:http/http.dart' as http;

class ApiService {
  String host = 'https://lb7u7svcm5.execute-api.ap-southeast-1.amazonaws.com';

  Future<http.Response> getIngredients() {
    return http.get('$host/dev/ingredients');
  }
}
