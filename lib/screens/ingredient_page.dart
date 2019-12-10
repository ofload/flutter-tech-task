import 'package:flutter/material.dart';

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
    );
  }

  Widget _buildPage(BuildContext context) {

    final children = <Widget>[];
    
    return ListView(
      padding: EdgeInsets.zero,
      children: children,
    );
  }
}

