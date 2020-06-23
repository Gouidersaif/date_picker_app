import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';


class datePickPage extends StatefulWidget {
  @override
  _datePickPageState createState() => _datePickPageState();
}

class _datePickPageState extends State<datePickPage> {


  DateTime _date = new DateTime.now();
  TimeOfDay _time = new TimeOfDay.now();

  Future<Null> _selectdate(BuildContext context) async{
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: new DateTime(1998),
        lastDate: new DateTime(2021)
    );

    if (picked != null && picked != _date){
      print('Date selected: ${_date.toString()}');
      setState(() {
        _date=picked;
      });
    }
  }
  Future<Null> _selectTime(BuildContext context)async{
    final TimeOfDay picked = await showTimePicker(
        context: context,
        initialTime: _time
    );
    if (picked != null && picked != _time){
      print('_time selected: ${_time.toString()}');
      setState(() {
        _time=picked;
      });
    }
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("SportPAL",style:TextStyle(
          fontWeight: FontWeight.bold,fontSize: 24
        ))),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 80,),
            RaisedButton(
              child: Text("select date"),
              onPressed: (){
                _selectdate(context);
              },
            ),
            Text("'Date selected: ${_date.toString()}'"),
            RaisedButton(
              child: Text("select time"),
              onPressed: (){
                _selectTime(context);
              },
            ),
            Text("Time selected: ${_time.toString()}"),

          ],
        ),
      ),
    );
  }
}
