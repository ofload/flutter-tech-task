import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_task/core/view_model/view_model.dart';
import 'package:tech_task/view/utils/colors.dart';
import 'package:tech_task/view/widget/button.dart';
import 'package:tech_task/view/widget/check_box.dart';

class IngredientsScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final  ViewModel _ingredientsViewModel = Provider.of<ViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Available ingredients',
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height-250,
              child: ListView.builder(
                itemCount: _ingredientsViewModel.ingredients.length,
                itemBuilder: (context, index)=> ListTile(
                  leading: GestureDetector(
                    onTap: (){
                      _ingredientsViewModel.selectIngredient(_ingredientsViewModel.ingredients[index]);
                    },
                    child: Consumer<ViewModel>(
                      builder: (context, ingredientVM, child)=> AppCheckBox(
                        isActive: ingredientVM.ingredients[index].isSelected,
                      ),
                    ),
                  ),
                  title:  Text(
                    _ingredientsViewModel.ingredients[index].title,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  subtitle: Text(
                    _ingredientsViewModel.ingredients[index].useBy,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  trailing: _ingredientsViewModel.ingredients[index].isExpired? Icon(Icons.error, color: kRed,): SizedBox(),
                ),
              ),
            ),
            const Spacer(),
            AppButton(
              text: 'Get Recipes',
              onTap: () {
                _ingredientsViewModel.getRecipes(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}


