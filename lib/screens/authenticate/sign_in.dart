import 'package:ethinicty_recognition_app/services/auth.dart';
import 'package:ethinicty_recognition_app/shared/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class SignIn extends StatefulWidget {
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
            image: AssetImage('assets/back2.jpg'),
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
                    color: Colors.brown[300],
                    borderRadius: BorderRadius.circular(0.0)
                  ),
                  child: Text('Ethnicity App',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.brown[900],
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
                  },
                  color: Colors.brown[700],
                  child: Text('Login',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
                child: Text(this.error,
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}



