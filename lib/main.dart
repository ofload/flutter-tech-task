import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_task/core/service/provider.dart';
import 'package:tech_task/view/screen/home_screen.dart';
import 'package:tech_task/view/utils/theme.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...providers,
      ],
      child: MaterialApp(
            title: 'Recipe Application',
            debugShowCheckedModeBanner: false,
            theme: appTheme,
            home: HomeScreen(),
          ),
    );
        }
  }