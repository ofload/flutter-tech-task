import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tech_task/interfaces/recipes.dart';
import 'package:tech_task/models/recipes.dart';
import 'package:tech_task/services/api/api.dart';
import 'package:tech_task/widgets/list-recipe.dart';

class RecipeListPage extends StatefulWidget {
  final DateTime date;
  final List<String> ingredients;

  const RecipeListPage(
      {Key key, @required this.date, @required this.ingredients})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => _RecipeListPage();
}

class _RecipeListPage extends State<RecipeListPage> {
  var api = ApiService();
  var recipeModel = RecipeModel();
  List<RecipeInterface> recipes;
  @override
  void initState() {
    this.api.getRecipes(widget.ingredients).then((value) {
      List<dynamic> body = jsonDecode(value.body);
      setState(() {
        this.recipes = body.map((e) => RecipeInterface.fromJson(e)).toList();
      });

      this.recipes.forEach((element) {
        this.recipeModel.insert(new RecipeModel(
            id: DateTime.now().microsecondsSinceEpoch.toString(),
            title: element.title,
            ingredients: jsonEncode(element.ingredients),
            date: DateFormat('yyyy-MM-dd').format(widget.date)));
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding:
          EdgeInsets.only(left: 35.0, top: 100.0, right: 35.0, bottom: 25.0),
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 20.0),
          child: Text('Choose Your Lunch',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  color: Colors.black)),
        ),
        this.recipes != null
            ? this.recipes.length > 0
                ? ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: this.recipes.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      return ListRecipe(
                          title: this.recipes[index].title,
                          ingredients: this.recipes[index].ingredients);
                    })
                : Text('No Ingredients in Your Fridge')
            : Padding(
                padding: EdgeInsets.only(top: 100.0),
                child: Center(
                  child: CircularProgressIndicator(),
                ))
      ],
    ));
  }
}
