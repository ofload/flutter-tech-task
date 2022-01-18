
import 'package:flutter_test/flutter_test.dart';
import 'package:tech_task/core/models/ingredient.dart';
import 'package:tech_task/core/view_model/view_model.dart';


void main() {
  ViewModel _viewModel;
  List<Ingredient> _ingredient;

  setUp(() {
    _viewModel = ViewModel();
    _ingredient = [
      Ingredient(
        title: 'Ham',
        useBy: '2023-02-11',
      ),
    ];
  });

  test('ingredients is not expired if the useBy date is after the current date',
      () {
    _viewModel.sortingExpiredIngredients(_ingredient);

    expect(_ingredient[0].isExpired, false);
  });


  test('ingredients is selected if ingredient is not expired', () {
    _viewModel.selectIngredient(_ingredient[0]);

    expect(_ingredient[0].isSelected, true);
  });
}
