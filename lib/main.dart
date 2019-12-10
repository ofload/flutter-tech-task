import 'package:flutter/material.dart';
import 'package:tech_task/screens/lunch_page.dart';

String root = "https://lb7u7svcm5.execute-api.ap-southeast-1.amazonaws.com/dev";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loadsmile Lunch App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: LunchPage(),
    );
  }
}
