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
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var factor = 1 / 740.0 * height;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(0.0),
          height: height,
          width: width,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 9,
                child: Container(
                  color: Colors.black,
                  padding: EdgeInsets.only(
                    left: factor * 20,
                    right: factor * 20,
                  ),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Container(
                            padding: EdgeInsets.only(bottom: 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            child: FittedBox(
                              child: Text(
                                '''Ethnicity App''',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.blue[900],
                                    fontSize: factor * 52.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Pacifico'),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.all(0),
                            child: TextFormField(
                              validator: (val) =>
                                  val.isEmpty ? 'Enter a valid Email' : null,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: factor * 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                              decoration: inputDecorationForm(factor)
                                  .copyWith(hintText: 'Enter Email'),
                              onChanged: (val) {
                                setState(
                                  () {
                                    this.email = val;
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: factor * 3,
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.all(0),
                            child: TextFormField(
                              validator: (val) => val.length < 5
                                  ? 'Invalid or empty password'
                                  : null,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: factor * 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                              decoration: inputDecorationForm(factor)
                                  .copyWith(hintText: 'Enter Password'),
                              onChanged: (val) {
                                this.password = val;
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: factor * 2,
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: factor * 15,
                              bottom: factor * 15,
                            ),
                            child: ButtonTheme(
                              height: factor * 40.0,
                              minWidth: factor * 220.0,
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
                                  dynamic result =
                                      await _auth.signInEmailAndPassword(
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
                                    fontSize: factor * 17.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: factor * 10.0,
                          child: Text(
                            this.error,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: factor * 16.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: factor * 100,
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: Colors.blue,
                              width: factor * 2,
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
                                fontSize: factor * 16.0,
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
                              width: factor * 2,
                            ),
                            left: BorderSide(
                              color: Colors.blue,
                              width: factor * 2,
                            ),
                          ),
                        ),
                        padding: EdgeInsets.all(0),
                        child: ButtonTheme(
                          buttonColor: Colors.white,
                          child: FlatButton(
                            child: Text(
                              'Register',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: factor * 16.0,
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
