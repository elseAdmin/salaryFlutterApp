import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_web/app_config.dart';
import 'package:flutter_web/constants/route_names.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget{
  
  @override
  _LoginForm createState() => _LoginForm();
}

class _LoginForm extends State<LoginPage>{
  final _passwordTextController = TextEditingController();
  final _usernameTextController = TextEditingController();

  double _formProgress = 1;
  String loginUrl;
  String _message = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var config = AppConfig.of(context);
    print("config::::::::::");

    print(config.apiBaseUrl);
    loginUrl = config.apiBaseUrl + config.signInUrl;
  }

  void loginClicked() async{
    var response = await http.post(loginUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': _usernameTextController.text,
        'password': _passwordTextController.text,
      }),
    );

    print(response);
    if(response.statusCode == 200) {
      // TODO get token and save it in some global variable sort
      Navigator.pushNamed(context,
        RouteNames.dashboard,
      );
    } else {
      setState(() {
        _message = 'Wrong credentials try again';
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width/3,
          height: MediaQuery.of(context).size.height/2,
          child: Card(
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  LinearProgressIndicator(value: _formProgress),
                  Text('COMPANY NAME', style: Theme
                      .of(context)
                      .textTheme
                      .display1), // display1 changes to headline4 in 1.16
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _usernameTextController,
                      decoration: InputDecoration(hintText: 'Username'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _passwordTextController,
                      decoration: InputDecoration(hintText: 'Password'),
                    ),
                  ),
                  FlatButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: loginClicked,
                    child: Text('Sign In'),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(_message),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}