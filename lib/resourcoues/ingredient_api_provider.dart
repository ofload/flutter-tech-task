import 'package:http/http.dart' show Client;
import 'package:tech_task/models/ingredients.dart';
import 'dart:convert';
import '../main.dart';

class IngredientApiProvider {
  
  Client client = Client();
  String _url = root;

  Future<List<Ingredients>> fetchPartNumbers() async {
    final response = await client.get('$_url/ingredients');
    final ingredients = json.decode(response.body) as List;

    return ingredients.map((i) => Ingredients.fromJson(i)).toList();
  }
}