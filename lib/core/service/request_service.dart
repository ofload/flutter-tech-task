
import 'package:dio/dio.dart';
import 'package:tech_task/core/models/ingredient.dart';
import 'package:tech_task/core/models/receipt.dart';
import 'package:tech_task/core/service/api_handler.dart';

import 'api_response.dart';

class RequestService {
  RequestService() {
    _apiHandler = ApiHandler();
  }

  ApiHandler _apiHandler= ApiHandler();

  Future<ApiResponse> getIngredients() async {
    ApiResponse apiResponse = ApiResponse(error: false);
    List<Ingredient> ingredients = [];
    String getIngredientUrl = "${_apiHandler.baseUrl}/ingredients";

    try {
      Response response = await _apiHandler.get(
        getIngredientUrl,
      );

      if (response.statusCode == 200) {
        response.data.forEach((ingredient) {
          ingredients.add(Ingredient.fromJson(ingredient));
        });

        apiResponse.data = ingredients;

      } else {
        apiResponse.error = true;
        apiResponse.message =
            response.data['message'] ?? 'Something went wrong, try again.';
      }
    } on Exception catch (e) {
      apiResponse.error = true;
      apiResponse.message = DioExceptions.fromDioError(e).toString();
    }

    return apiResponse;
  }



  Future<ApiResponse> getRecipes(List<String> params) async {
    ApiResponse apiResponse = ApiResponse(error: false);
    List<Recipe> recipes = [];
    String getRecipesUrl = "${_apiHandler.baseUrl}/recipes?ingredients=$params";

    try {
      Response response = await _apiHandler.get(
        getRecipesUrl,
      );

      if (response.statusCode == 200) {

        response.data.forEach((recipe) {
          recipes.add(Recipe.fromJson(recipe));
        });

        apiResponse.data = recipes;

      } else {
        apiResponse.error = true;
        apiResponse.message =
            response.data['message'] ?? 'Something went wrong, try again.';
      }
    } on Exception catch (e) {
      apiResponse.error = true;
      apiResponse.message = DioExceptions.fromDioError(e).toString();
    }

    return apiResponse;
  }




}