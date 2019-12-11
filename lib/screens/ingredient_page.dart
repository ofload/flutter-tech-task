import 'package:flutter/material.dart';
import 'package:tech_task/models/ingredients.dart';

class IngredientPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IngredientState();
  }
}

class _IngredientState extends State<IngredientPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lunch Ingredients'),
      ),
      body: _buildPage(context),
       floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, '/recipe');
        },
        child: Icon(Icons.next_week),
      ),
    );
  }

  Widget _buildPage(BuildContext context) {
    final children = <Widget>[];
   
    final listNotification = buildList();
    final container = Container(
      height: MediaQuery.of(context).size.height - 130,
      child: listNotification,
    );
    children.add(container);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children,
    );

  }

  Widget buildList() {
    final List<Ingredients> ingredients = <Ingredients>[
      Ingredients(title: "Ham", useBy: "2019-11-25"),
      Ingredients(title: "Cheese", useBy: "2019-11-25"),
      Ingredients(title: "Bread", useBy: "2019-11-25"),
      Ingredients(title: "Butter", useBy: "2019-11-25"),
      Ingredients(title: "Bacon", useBy: "2019-11-25"),
      Ingredients(title: "Eggs", useBy: "2019-11-25"),
    ];

    return ListView.builder(
      itemCount: ingredients.length,
      itemBuilder: (context, index) {
        return Center(
          child: CheckboxListTile(
            title: Text('${ingredients[index].title}'),
            subtitle: Text('use-by : ${ingredients[index].useBy}'),
            value: false,
            onChanged: (bool value) { },
          ),
        );
      }
    );
  }
}

