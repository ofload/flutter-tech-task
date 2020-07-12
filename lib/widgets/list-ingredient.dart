import 'package:flutter/material.dart';

class ListIngredient extends StatelessWidget {
  final String title;
  final bool selected;

  const ListIngredient({Key key, @required this.title, this.selected})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
            title: Text(this.title),
            trailing: selected != null && selected
                ? Icon(Icons.check_circle, color: Colors.green)
                : null),
        elevation: 0.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        color: selected != null && selected ? Colors.green[100] : null);
  }
}
