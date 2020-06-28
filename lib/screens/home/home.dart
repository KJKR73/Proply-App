import 'package:ethinicty_recognition_app/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
            RaisedButton(
            child: Text('Logout'),
            onPressed: () async {
              _auth.signOut();
            },
          ),
            RaisedButton(
            child: Text('page1'),
            onPressed: () {
              Navigator.pushNamed(context, '/task1');
            },
          ),
        ]
      ),
    );
  }
}