import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tech_task/models/recipes.dart';
import 'package:tech_task/widgets/list-recipe.dart';

class SchedulePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SchadulePage();
}

class _SchadulePage extends State<SchedulePage> {
  var recipeModel = RecipeModel();
  List<RecipeModel> _recipeList;

  @override
  void initState() {
    this._getCurrectRecipes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(left: 35.0, top: 100.0, right: 35.0),
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 20.0),
          child: Text('Lunch Schedule',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  color: Colors.black)),
        ),
        this._recipeList != null
            ? this._recipeList.length > 0
                ? ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: this._recipeList.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      return ListRecipe(
                        date: this._recipeList[index].date,
                        title: this._recipeList[index].title,
                        ingredients:
                            jsonDecode(this._recipeList[index].ingredients),
                      );
                    })
                : Container()
            : Container()
      ],
    );
  }

  _getCurrectRecipes() {
    this.recipeModel.getAll().then((value) {
      var data = value.toList();
      setState(() {
        this._recipeList = data;
        data.sort((a, b) => a.date.compareTo(b.date));
      });
    });
  }
}
