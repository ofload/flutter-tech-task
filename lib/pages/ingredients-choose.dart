import 'package:flutter/material.dart';

class IngredientsChoosePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IngredientsChoosePage();
}

class _IngredientsChoosePage extends State<IngredientsChoosePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(left: 35.0, top: 100.0, right: 35.0),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Text('Choose Ingredients',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    color: Colors.black)),
          ),
          Card(
              child: ListTile(title: Text('Bread')),
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0))),
          Card(
              child: ListTile(
                title: Text('Ham'),
                trailing: Icon(Icons.check_circle, color: Colors.green),
              ),
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              color: Colors.green[100]),
          Card(
              child: ListTile(title: Text('Butter')),
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0))),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.chevron_right),
      ),
    );
  }
}
