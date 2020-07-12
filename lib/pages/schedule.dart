import 'package:flutter/material.dart';

class SchedulePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SchadulePage();
}

class _SchadulePage extends State<SchedulePage> {
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
        Card(
            child: ListTile(
              title: Text('21 July 2020'),
              subtitle: Text('Salad'),
            ),
            elevation: 0.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            )),
        Card(
            child: ListTile(
              title: Text('21 July 2020'),
              subtitle: Text('Salad'),
            ),
            elevation: 0.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            )),
        Card(
            child: ListTile(
              title: Text('21 July 2020'),
              subtitle: Text('Salad'),
            ),
            elevation: 0.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            )),
        Card(
            child: ListTile(
              title: Text('21 July 2020'),
              subtitle: Text('Salad'),
            ),
            elevation: 0.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            )),
        Card(
            child: ListTile(
              title: Text('21 July 2020'),
              subtitle: Text('Salad'),
            ),
            elevation: 0.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            )),
      ],
    );
  }
}
