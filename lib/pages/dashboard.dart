import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tech_task/models/recipes.dart';
import 'package:tech_task/pages/ingredients-choose.dart';
import 'package:tech_task/widgets/button-date.dart';
import 'package:tech_task/widgets/list-recipe.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DashboardPage();
}

class _DashboardPage extends State<DashboardPage> {
  var recipeModel = RecipeModel();

  DateTime _currentTime = DateTime.now();
  List _currentTimeList = new List();
  DateTime _selectedTime;
  List<RecipeModel> _selectedRecipeList;

  @override
  void initState() {
    // Initialize selectedTime
    this._selectedTime = this._currentTime;

    // Initialize _currentTimeList value
    for (var x = -1; x < 6; x++) {
      var dateValue = _currentTime.add(Duration(days: x));
      _currentTimeList.add({
        'date': dateValue,
        'selected': dateValue == _selectedTime ? true : false
      });
    }
    this._getCurrectRecipes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(left: 35.0, top: 100.0, right: 35.0),
      children: <Widget>[
        RichText(
          text: TextSpan(
            text: '${DateFormat('dd MMMM y').format(_currentTime)}\n',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                height: 1.5,
                color: Colors.grey),
            children: <TextSpan>[
              TextSpan(
                  text: 'Daily Lunch\n',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      color: Colors.black)),
              TextSpan(
                  text:
                      'Plan your daily lunch based on the contents of your fridge',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14.0,
                      color: Colors.grey[800])),
            ],
          ),
        ),
        Container(
          height: 100,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _currentTimeList.length,
              itemBuilder: (BuildContext ctx, int index) {
                return GestureDetector(
                    child: ButtonDate(
                      dateTime: _currentTimeList[index]['date'],
                      selected: _currentTimeList[index]['selected'],
                    ),
                    onTap: () => _onSelect(index));
              }),
        ),
        this._selectedRecipeList == null || this._selectedRecipeList.length == 0
            ? FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              IngredientsChoosePage(date: this._selectedTime)));
                },
                child: Text('Check Recipes',
                    style: TextStyle(color: Colors.white)),
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ))
            : Container(),
        this._selectedRecipeList != null
            ? this._selectedRecipeList.length > 0
                ? ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: this._selectedRecipeList.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      return ListRecipe(
                        title: this._selectedRecipeList[index].title,
                        ingredients: jsonDecode(
                            this._selectedRecipeList[index].ingredients),
                      );
                    })
                : Container()
            : Container()
      ],
    );
  }

  _onSelect(int index) {
    setState(() {
      this._currentTimeList = this._currentTimeList.map((e) {
        e['selected'] = false;
        return e;
      }).toList();

      this._currentTimeList[index]['selected'] =
          !this._currentTimeList[index]['selected'];

      this._selectedTime = this._currentTimeList[index]['date'];
    });

    this._getCurrectRecipes();
  }

  _getCurrectRecipes() {
    var selectedDate = DateFormat('yyyy-MM-dd').format(this._selectedTime);
    this.recipeModel.getAll().then((value) {
      var data = value.where((element) {
        return element.date == selectedDate;
      }).toList();
      setState(() {
        this._selectedRecipeList = data;
      });
    });
  }
}
