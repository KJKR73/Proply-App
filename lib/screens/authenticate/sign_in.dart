import 'package:ethinicty_recognition_app/services/auth.dart';
import 'package:ethinicty_recognition_app/shared/constant.dart';
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
  bool loading  = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/back3.png'),
            fit: BoxFit.cover
          )
        ),
        padding: EdgeInsets.only(top: 100, left: 20, right: 20),
        child: Form(
          key: _formkey,
            child: Column(
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                    //color: Colors.brown[300],
                    borderRadius: BorderRadius.circular(0.0)
                  ),
                  child: Text('Ethnicity App',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 70.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                validator: (val) => val.isEmpty ? 'Enter a valid Email' : null,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
                decoration: inputDecorationForm.copyWith(hintText: 'Enter Email'),
                onChanged: (val) {
                  setState(() {
                    this.email = val;
                  });
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                validator: (val) => val.length < 5  ? 'Invalid or empty password' : null,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
                decoration: inputDecorationForm.copyWith(hintText: 'Enter Password'),
                onChanged: (val) {
                  this.password = val;
                },
              ),
              SizedBox(height: 20.0),
              ButtonTheme(
                height: 60.0,
                minWidth: 200.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  onPressed: () async {
                    if (_formkey.currentState.validate()) {
                      setState(() {
                        loading = true;
                      });
                    }
                    dynamic result = await _auth.signInEmailAndPassword(this.email, this.password);
                    if (result == null) {
                      setState(() {
                        this.error = 'Please enter valid email and password';
                        loading = false;
                      });
                    }
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.setString('email', this.email);
                    prefs.setString('password', this.password);
                  },
                  color: Colors.black,
                  child: Text('Login',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.0),
              SizedBox(
                height: 20.0,
                child: Text(this.error,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0
                  ),
                ),
              ),
              SizedBox(height : 40.0),
              InkWell(
                child: Text('Sign in Anony',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize : 16.0,
                    decoration: TextDecoration.underline,
                    letterSpacing: 1.0
                  )
                ),
                onTap: () async {
                  dynamic result = await _auth.signInAnon();
                  if (result == null) {
                    print('Cannot Sing In Anony');
                  }
                } 
              ),
              SizedBox(height : 40.0),
              InkWell(
                child: Text(' New User Register',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize : 16.0,
                    decoration: TextDecoration.underline,
                    letterSpacing: 1.0,
                  )
                ),
                onTap: () {
                  widget.toggleView();
                }
              )
            ],
          ),
        )
      ),
    );
  }
}



