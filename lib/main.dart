import 'package:flutter/material.dart';
import 'package:tech_task/pages/dashboard.dart';
import 'package:tech_task/pages/ingredients-choose.dart';
import 'package:tech_task/pages/schedule.dart';

import 'models/recipes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ValueNotifier<List<RecipeModel>> _selectedRecipeList =
      ValueNotifier<List<RecipeModel>>(null);
  int _selectedIndex = 0;
  List _page;

  @override
  void initState() {
    this._page = [
      DashboardPage(selectedRecipeList: _selectedRecipeList),
      SchedulePage()
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _page[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Dashboard'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.today),
            title: Text('Lunch Schedule'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _selectDate(context), child: Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  _onItemTapped(int index) {
    setState(() {
      this._selectedIndex = index;
    });
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => IngredientsChoosePage(
                  selectedRecipeList: this._selectedRecipeList, date: picked)));
    }
  }
}
