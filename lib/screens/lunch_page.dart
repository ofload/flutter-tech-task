import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:intl/intl.dart';

class LunchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LunchState();
  }
}

class _LunchState extends State<LunchPage> {

  TextEditingController _lunchDatePickerController = new MaskedTextController(mask: '0000-00-00');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loadsmile Lunch App'),
      ),
      body: _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {

    final children = <Widget>[];

    final lunchDate = buildLunchDate(context);
    children.add(buildLabel('Lunch Date'));
    children.add(lunchDate);

    final submitButton = buildSubmitButton(context);
    children.add(submitButton);
    
    return ListView(
      padding: EdgeInsets.zero,
      children: children,
    );
  }

  Widget buildLabel(String label) {
    final labelContainer =  Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          ),
        ),
     );
    return labelContainer;
  }

  Widget buildLunchDate(BuildContext context) {

    final lunchDate = Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: TextField(
        controller: _lunchDatePickerController,
        keyboardType: TextInputType.datetime,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            suffixIcon: InkResponse(
            onTap: () => _selectDate(context, _lunchDatePickerController),
            child: Icon(Icons.date_range),
          ),
        ),
      ),
    );

    return lunchDate;
  }

  Future<Null> _selectDate(BuildContext context, TextEditingController _datePickerController) async {
    DateTime selectedDate = DateTime.now();
    final DateTime pickedDate = await showDatePicker(
        context: context,
        firstDate: DateTime(2019),
        initialDate: selectedDate,
        lastDate: DateTime(2030));
    if (pickedDate != null && pickedDate != selectedDate)
      setState(() {
        selectedDate = pickedDate;
        _datePickerController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
      },
    );
  }

  Widget buildSubmitButton(BuildContext context) {
    final submitButton = Container(
      margin: EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height * 0.09,
      child: RaisedButton(
        onPressed: (){
          Navigator.pushNamed(context, '/ingredients');
        },
        color: Colors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Text('Get Ingredients',
          textAlign: TextAlign.center, style: TextStyle(color: Colors.white),
        ),
      ),
    );
    
    return submitButton;
  }

}