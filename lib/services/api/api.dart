import 'package:http/http.dart' as http;

class ApiService {
  String host = 'https://lb7u7svcm5.execute-api.ap-southeast-1.amazonaws.com';

  Future<http.Response> getIngredients() {
    return http.get('$host/dev/ingredients');
  }

  Future<http.Response> getRecipes(List<String> ingredients) {
    var flatten = '';
    for (int x = 0; x < ingredients.length; x++) {
      flatten += '${ingredients[x]},';
    }
    return http.get('$host/dev/recipes?ingredients=$flatten');
  }
}
