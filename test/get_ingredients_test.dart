import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:tech_task/core/models/ingredient.dart';
import 'package:tech_task/core/service/api_handler.dart';
import 'package:tech_task/core/service/api_response.dart';
import 'package:tech_task/core/service/request_service.dart';

import 'response_reader.dart';

class MockClient extends Mock implements http.Client {}

main() {
  ApiHandler apiHandler = ApiHandler();
  RequestService service = RequestService();
  final client = MockClient();
  final ingredientUrl = "${apiHandler.baseUrl}/ingredients";


  test('returns Ingredients', () async {
    when(client.get(Uri.parse(ingredientUrl))).thenAnswer((_) async =>
        http.Response(responseData('ingredients_response.json'), 200));

    ApiResponse apiResponse = await service.getIngredients();

    expect(apiResponse.data, isA<List<Ingredient>>());
  });
}
