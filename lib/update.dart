import 'package:flutter/material.dart';
import 'welcome.dart';

class UpdatePage extends StatefulWidget{
  @override
  _UpdatePagestate createState() {
    _UpdatePagestate();
  }
}

class _UpdatePagestate extends State<UpdatePage>{
  final TextEditingController newpasscontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        Container(
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 60.0, 0.0, 0.0),
                child: Text(
                  'Change Password',
                  style:
                  TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 60.0, 0.0, 0.0),
                child: Text(
                  'Change password',
                  style:TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.0,),
        TextFormField(
          controller: newpasscontroller,
          decoration: InputDecoration(
              labelText: 'NEW PASSWORD ',
              labelStyle: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green))),
          obscureText: true,
        ),
        SizedBox(height: 10.0,),
        Container(
            height: 40.0,
            child: Material(
              borderRadius: BorderRadius.circular(20.0),
              shadowColor: Colors.greenAccent,
              color: Colors.green,
              elevation: 7.0,
              child: RaisedButton(
                onPressed: () {},
                child: Center(
                  child: Text(
                    'update',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat'),
                  ),
                ),
              ),
            )),
      ])
    );
  }
}
