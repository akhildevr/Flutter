import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'main.dart';

void main() {
  runApp(MyApp());
}

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/main': (BuildContext context) => new MyHomePage(),
      },
    );
  }
}

class Country {
  int id;
  String contry;

  Country(this.id, this.contry);

  static List<Country> getCountry() {
    return <Country>[
      Country(0, 'Select Country'),
      Country(1, 'America'),
      Country(2, 'Australia'),
      Country(3, 'England'),
      Country(4, 'India'),
      Country(5, 'Russia'),
    ];
  }
}

class _SignupPageState extends State<SignupPage> {
  bool _isLoading = false;
  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _addressController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _phonenoController = new TextEditingController();
  final TextEditingController _passController = new TextEditingController();

  _signup(String _namController, String _addrController, String _emalController, String _phoneController,
        String _pasController, String _countryController)async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      "uname": _namController,
      "address": _addrController,
      "email": _emalController,
      "phoneno": _phoneController,
      "pass": _pasController,
      "country": _countryController,
    };
    var jsonResponse;
    var response = await http.post('http://192.168.0.100:3000/customer',body: data);
    if(response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      if(jsonResponse != null) {
        setState(() {
          _isLoading = false;
        });
        sharedPreferences.setString("token", jsonResponse['token']);
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => MyHomePage()), (Route<dynamic> route) => false);
      }
    }
    else {
      setState(() {
        _isLoading = false;
      });
      print(response.body);
    }
  }

  List<Country> _country = Country.getCountry();
  List<DropdownMenuItem<Country>> _dropdownMenuItems;
  Country _selectedCountry;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_country);
    _selectedCountry = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Country>> buildDropdownMenuItems(List _counTry) {
    List<DropdownMenuItem<Country>> items = List();
    for (Country country in _counTry) {
      items.add(
        DropdownMenuItem(
          value: country,
          child: Text(country.contry),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Country selectedCountry) {
    setState(() {
      _selectedCountry = selectedCountry;
    });
  }

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
                      'Signup',
                      style:
                      TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(185.0, 55.0, 0.0, 0.0),
                    child: Text(
                      '.',
                      style: TextStyle(
                          fontSize: 80.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                  )
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller:_nameController,
                      decoration: InputDecoration(
                          labelText: 'NAME ',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                    ),
                    SizedBox(height: 8.0),
                    TextFormField(
                      controller:_addressController,
                      decoration: InputDecoration(
                          labelText: 'EMAIL',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          // hintText: 'EMAIL',
                          // hintStyle: ,
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                    ),
                    SizedBox(height: 8.0),
                    TextFormField(
                      controller:_emailController,
                      decoration: InputDecoration(
                          labelText: 'ADDRESS',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                    ),
                    SizedBox(height: 8.0),
                    TextFormField(
                      controller:_phonenoController,
                      decoration: InputDecoration(
                          labelText: 'PHONE NO',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                    ),
                    SizedBox(height: 8.0),
                    TextFormField(
                      controller:_passController,
                      decoration: InputDecoration(
                          labelText: 'PASSWORD ',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                      obscureText: true,
                    ),
                    SizedBox(height: 8.0,),
//      Dropdownlist
                    Container(
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
//                            Text("Select country"),
                            SizedBox(
                              height: 10.0,
                            ),
                            DropdownButton(
                              style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                              value: _selectedCountry,
                              items: _dropdownMenuItems,
                              onChanged: onChangeDropdownItem,
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 20.0),
                    Container(
                        height: 40.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.greenAccent,
                          color: Colors.green,
                          elevation: 7.0,
                          child: GestureDetector(
                            onTap: () {
                              _signup( _nameController.text, _addressController.text, _emailController.text, _passController.text,
                               _phonenoController.text, _selectedCountry.toString());
                              Navigator.of(context).push(
                                  new MaterialPageRoute(
                                  builder: (BuildContext context) => new MyHomePage(),
                                  ),
                              );
                            },
                            child: Center(
                              child: Text(
                                'REGISTER',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                        )),
                    SizedBox(height: 20.0),
                    Container(
                      height: 40.0,
                      color: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black,
                                style: BorderStyle.solid,
                                width: 1.0),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child:

                          Center(
                            child: Text('Go Back',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat')),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
        ]));
  }
}