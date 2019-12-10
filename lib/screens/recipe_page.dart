import 'package:flutter/material.dart';

class ReceipePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ReceipeState();
  }
}

class _ReceipeState extends State<ReceipePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lunch Receipes'),
      ),
      body: _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {

    final children = <Widget>[];
    
    return ListView(
      padding: EdgeInsets.zero,
      children: children,
    );
  }
}

