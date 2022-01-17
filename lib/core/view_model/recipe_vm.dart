import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_task/core/models/receipt.dart';
import 'package:tech_task/core/service/api_response.dart';
import 'package:tech_task/core/service/request_service.dart';
import 'package:tech_task/view/utils/wiget_helpers.dart';

class RecipeViewModel extends ChangeNotifier {
  RequestService _requestService = RequestService();
  List<Recipe> recipes = [];

  Future<void> getIngredients(context) async {
    WidgetHelpers.showLoadingDialog(
      context,
      title: 'Getting Ingredients',
    );

    ApiResponse apiResponse = await _requestService.getIngredients();

    if (apiResponse.error) {
      Navigator.pop(context);
      // show error dialog
      WidgetHelpers.showStatusDialog(
        context,
        error: true,
        title: apiResponse.message ??
            'Failed to fetch restaurant categories, try again later.',
      );
    } else {
      Navigator.pop(context);
      recipes.addAll(apiResponse.data);

      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (_) => IngredientsScreen(),
      //   ),
      // );
    }
  }

}
