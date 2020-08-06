import 'package:ethinicty_recognition_app/services/auth.dart';
import 'package:ethinicty_recognition_app/shared/constant.dart';
import 'package:ethinicty_recognition_app/ui/base_widget.dart';
import 'package:ethinicty_recognition_app/ui/sizing_information.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String error = "";
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var factor = 1 / 740.0;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.white,
                padding: EdgeInsets.only(
                  top: height * factor * 60,
                  left: height * factor * 20,
                  right: height * factor * 20,
                ),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: height * factor * 20.0),
                      Container(
                        height: height * factor * 100,
                        decoration: BoxDecoration(
                            //color: Colors.brown[300],
                            borderRadius: BorderRadius.circular(0.0)),
                        child: Text(
                          'Ethnicity App',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.blue[900],
                              fontSize: height * factor * 54.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Pacifico'),
                        ),
                      ),
                      SizedBox(height: height * 50.0 * factor),
                      Container(
                        padding: EdgeInsets.all(0),
                        height: height * factor * 62,
                        child: TextFormField(
                          validator: (val) =>
                              val.isEmpty ? 'Enter a valid Email' : null,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: height * factor * 16.0,
                          ),
                          decoration: inputDecorationForm.copyWith(
                              hintText: 'Enter Email'),
                          onChanged: (val) {
                            setState(
                              () {
                                this.email = val;
                              },
                            );
                          },
                        ),
                      ),
                      SizedBox(height: height * factor * 20.0),
                      Container(
                        padding: EdgeInsets.all(0),
                        height: height * factor * 62,
                        child: TextFormField(
                          validator: (val) => val.length < 5
                              ? 'Invalid or empty password'
                              : null,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: height * factor * 16.0,
                          ),
                          decoration: inputDecorationForm.copyWith(
                              hintText: 'Enter Password'),
                          onChanged: (val) {
                            this.password = val;
                          },
                        ),
                      ),
                      SizedBox(height: height * factor * 20.0),
                      ButtonTheme(
                        height: height * 60.0 * factor,
                        minWidth: height * factor * 200.0,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          onPressed: () async {
                            if (_formkey.currentState.validate()) {
                              setState(() {
                                loading = true;
                              });
                            }
                            dynamic result = await _auth.signInEmailAndPassword(
                                this.email, this.password);
                            if (result == null) {
                              setState(() {
                                this.error =
                                    'Please enter valid email and password';
                                loading = false;
                              });
                            }
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setString('email', this.email);
                            prefs.setString('password', this.password);
                          },
                          color: Colors.blue,
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: height * factor * 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height * factor * 20),
                      SizedBox(
                        height: height * factor * 10.0,
                        child: Text(
                          this.error,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: height * factor * 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * factor * 163,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.all(height * factor * 0),
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      child: ButtonTheme(
                        buttonColor: Colors.white,
                        child: FlatButton(
                          child: Text(
                            'Anonymous',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: height * factor * 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () async {
                            dynamic result = await _auth.signInAnon();
                            if (result == null) {
                              print('Cannot Sing In Anony');
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: Colors.blue,
                          ),
                          left: BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      padding: EdgeInsets.all(height * factor * 0),
                      child: ButtonTheme(
                        buttonColor: Colors.white,
                        child: FlatButton(
                          child: Text(
                            'Register',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: height * factor * 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                            widget.toggleView();
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
