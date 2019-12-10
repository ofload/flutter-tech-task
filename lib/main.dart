import 'package:flutter/material.dart';
import 'package:tech_task/screens/ingredient_page.dart';
import 'package:tech_task/screens/lunch_page.dart';
import 'package:tech_task/screens/recipe_page.dart';

String root = "https://lb7u7svcm5.execute-api.ap-southeast-1.amazonaws.com/dev";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loadsmile Lunch App',
      theme: ThemeData(primarySwatch: Colors.orange),
      onGenerateRoute: routes,
    );
  }

  Route routes(RouteSettings settings) {
      if(settings.name == '/') {
        return MaterialPageRoute(
          builder: (context) {
            return LunchPage();
          },
        );
      } else if(settings.name == '/ingredients'){
        return MaterialPageRoute(
          builder: (context) {
            return IngredientPage();
          },
        );
      }
      else {
        return MaterialPageRoute(
          builder: (context) {
            return ReceipePage();
          },
        );
      }
    }
}
