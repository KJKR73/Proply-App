import 'package:ethinicty_recognition_app/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Center(
          child: RaisedButton(
            color: Colors.white,
            child: Text('Sign In Anon'),
            onPressed: () async {
              dynamic result = await _auth.signInAnon();
              if (result == null){
                print('Error Signing In');
              }
              else{
                print('User Signed In');
                //print(result.uid);
              }
            },
          ),
        ),
      ),
    );
  }
}