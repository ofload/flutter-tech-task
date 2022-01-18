import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tech_task/core/models/ingredient.dart';
import 'package:tech_task/core/models/receipt.dart';
import 'package:tech_task/core/service/api_response.dart';
import 'package:tech_task/core/service/request_service.dart';
import 'package:tech_task/view/screen/ingredient_screen.dart';
import 'package:tech_task/view/screen/recipe_screen.dart';
import 'package:tech_task/view/utils/wiget_helpers.dart';

class ViewModel extends ChangeNotifier {



  DateTime selectedDate = DateTime.now();
  RequestService requestService = RequestService();
  List<Ingredient> ingredients = [];
  List<Recipe> recipes = [];
  List<String> selectedIngredients = [];


  pickDate(BuildContext context) async {
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 10),
      lastDate: DateTime(DateTime.now().year + 15),
      initialDate: selectedDate,
    );
    if (date != null) {
      selectedDate = date;
    }

    notifyListeners();
  }

  String formatDate() {
    String formattedDate = DateFormat("yyyy-MM-dd").format(selectedDate);
    return formattedDate;
  }

  Future<void> getIngredients(context) async {
    WidgetHelpers.showLoadingDialog(
      context,
      title: 'Getting Ingredients',
    );

    ApiResponse apiResponse = await requestService.getIngredients();

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
      ingredients.clear();
       Navigator.pop(context);
      ingredients.addAll(apiResponse.data);
      sortingExpiredIngredients(ingredients);

     Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => IngredientsScreen(),
        ),
      );

      notifyListeners();

      
    }
    
  }

  sortingExpiredIngredients(List<Ingredient> ingredientsList) {
    for (var i = 0; i < ingredientsList.length; i++) {
      //Converting the expiring date of the ingredients from a string to a DateTime variable
      DateTime expiringDate =
          new DateFormat("yyyy-MM-dd").parse(ingredientsList[i].useBy);

      //Comparing dates selected dates and expiring dates
      if (selectedDate.isAfter(expiringDate)) {
        ingredientsList[i].isExpired = true;
      } else {
        ingredientsList[i].isExpired = false;
      }
    }
  }

  Future<void> getRecipes(context) async {
    WidgetHelpers.showLoadingDialog(
      context,
      title: 'Getting Recipes',
    );

    ApiResponse apiResponse =
        await requestService.getRecipes(selectedIngredients);

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
      print(recipes);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => RecipesScreen(),
        ),
      );
    }
  }

  selectIngredient(Ingredient ingredient) {
    //Allowing user select only ingredients that hasn't expired
    if (!ingredient.isExpired) {
      ingredient.isSelected = !ingredient.isSelected;

      if (ingredient.isSelected) {
        selectedIngredients.add(ingredient.title);
      } else if (selectedIngredients.contains(ingredient.title)) {
        selectedIngredients.remove(ingredient.title);
      }
    }
    notifyListeners();
  }
}
