import 'package:ethinicty_recognition_app/services/auth.dart';
import 'package:ethinicty_recognition_app/shared/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String error = "";
  bool loading = false;

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
                  child: Text('Register',
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
                validator: (val) => val.isEmpty ? 'Enter a valid email' : null,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
                decoration: inputDecorationForm.copyWith(hintText: 'Enter Email'),
                onChanged: (val) {
                  this.email = val;
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
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
                      dynamic result = await _auth.registerEmailPassword(this.email, this.password);
                      if (result == null) {
                        setState(() {
                          this.error = "Enter a valid Email or Password";
                          loading = false;
                        });
                      }
                    }
                  },
                  color: Colors.brown[700],
                  child: Text('Register',
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