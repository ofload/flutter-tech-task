import 'package:flutter/material.dart';
import 'package:tech_task/view/screen/home_screen.dart';
import 'package:tech_task/view/utils/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: appTheme,
      home: HomeScreen(),
    );
  }
}

