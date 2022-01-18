import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_task/core/view_model/view_model.dart';
import 'package:tech_task/view/utils/colors.dart';

class RecipesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _ingredientsViewModel =
        Provider.of<ViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recipes',
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView.builder(
          itemCount: _ingredientsViewModel.recipes.length,
          itemBuilder: (context, index) => Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _ingredientsViewModel.recipes[index].title,
                  style: Theme.of(context).textTheme.headline2.copyWith(color: kWhite),
                ),
                ..._ingredientsViewModel.recipes[index].ingredients.map(
                  (ingredients) => Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      ingredients,
                      style: Theme.of(context).textTheme.bodyText1.copyWith(color: kWhite),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
