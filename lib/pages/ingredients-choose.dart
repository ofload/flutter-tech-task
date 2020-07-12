import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tech_task/interfaces/ingredient.dart';
import 'package:tech_task/pages/recipe-list.dart';
import 'package:tech_task/services/api/api.dart';
import 'package:tech_task/widgets/list-ingredient.dart';

class IngredientsChoosePage extends StatefulWidget {
  final DateTime date;

  const IngredientsChoosePage({Key key, this.date}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _IngredientsChoosePage();
}

class _IngredientsChoosePage extends State<IngredientsChoosePage> {
  var api = new ApiService();
  List<IngredientInterface> ingredients;
  @override
  void initState() {
    api.getIngredients().then((value) {
      List body = jsonDecode(value.body);
      setState(() {
        this.ingredients =
            body.map((e) => IngredientInterface.fromJson(e)).where((element) {
          return DateTime.parse(element.useBy).compareTo(widget.date) > -1;
        }).toList();
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
            child: Text('Choose Ingredients',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    color: Colors.black)),
          ),
          this.ingredients != null
              ? this.ingredients.length > 0
                  ? ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: this.ingredients.length,
                      itemBuilder: (BuildContext ctx, int index) {
                        return GestureDetector(
                          child: ListIngredient(
                              title: this.ingredients[index].title,
                              selected: this.ingredients[index].selected),
                          onTap: () => _onSelect(index),
                        );
                      })
                  : Text('No Ingredients in Your Fridge')
              : Padding(
                  padding: EdgeInsets.only(top: 100.0),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ))
        ],
      ),
      floatingActionButton:
          this.ingredients != null && this.ingredients.length > 0
              ? FloatingActionButton(
                  onPressed: () => _getReceipts(),
                  child: Icon(Icons.chevron_right),
                )
              : null,
    );
  }

  _onSelect(int index) {
    // Change to json first because variable is final and cannot make
    // a change of the value
    var data = this.ingredients[index].toJson();
    data['selected'] = !data['selected'];
    setState(() {
      this.ingredients[index] = IngredientInterface.fromJson(data);
    });
  }

  _getReceipts() {
    var selectedIngredients = this
        .ingredients
        .where((element) => element.selected)
        .map((e) => e.title)
        .toList();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                RecipeListPage(ingredients: selectedIngredients)));
  }
}
