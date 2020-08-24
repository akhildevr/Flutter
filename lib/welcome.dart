import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
            body:Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
//              color: Colors.blueAccent,
              child: Center(
                child: Container(
                  padding: EdgeInsets.only(left: 30.0,right: 30.0),
                  width: 400,
                  height: 500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Image.asset('assets/Apple-green-logo.png',width: 300,height: 200),
                      TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: 'WELCOME',
                        ),
                        style: TextStyle(
                            fontSize:50.0,
                            color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      Container(
                        padding: EdgeInsets.only(left: 40.0,right: 40.0),
                        height: 40.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(8.0),
                          shadowColor: Colors.greenAccent,
                          color: Colors.green,
                          elevation: 7.0,
                          child: RaisedButton(
                              onPressed: (){},
                              child: Center(
                                child: Text(
                                  'Change Password',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                              )
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 40.0,right: 40.0),
                        height: 40.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          shadowColor: Colors.greenAccent,
                          color: Colors.green,
                          elevation: 7.0,
                          child: RaisedButton(
                              onPressed: (){},
                              child: Center(
                                child: Text(
                                  'Delete Account',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                              )
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 40.0,right: 40.0),
                        height: 40.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(8.0),
                          shadowColor: Colors.greenAccent,
                          color: Colors.green,
                          elevation: 7.0,
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/welcome');
                            },
                            child:
                            Center(
                              child: Text(
                                'Logout',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}