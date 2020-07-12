import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ButtonDate extends StatelessWidget {
  final DateTime dateTime;
  final bool selected;

  const ButtonDate({Key key, this.dateTime, this.selected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Text(
            dateTime.day.toString(),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                height: 1.5,
                color:
                    selected != null && selected ? Colors.blue : Colors.grey),
          ),
          Text(DateFormat('E').format(dateTime),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  height: 1.5,
                  color: selected != null && selected
                      ? Colors.blue
                      : Colors.black)),
          selected != null && selected
              ? Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Icon(
                    Icons.brightness_1,
                    size: 7,
                    color: Colors.blue,
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
