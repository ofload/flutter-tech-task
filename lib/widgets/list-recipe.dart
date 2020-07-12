import 'package:flutter/material.dart';

class ListRecipe extends StatelessWidget {
  final String title;
  final bool selected;
  final List<dynamic> ingredients;

  const ListRecipe(
      {Key key, @required this.title, this.selected, this.ingredients})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
            title: Text(this.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text('Ingredients',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: this.ingredients.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      return Text(this.ingredients[index]);
                    })
              ],
            ),
            trailing: selected != null && selected
                ? Icon(Icons.check_circle, color: Colors.green)
                : null),
        elevation: 0.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        color: selected != null && selected ? Colors.green[100] : null);
  }
}
