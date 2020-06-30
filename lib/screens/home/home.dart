import 'package:ethinicty_recognition_app/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  MediaQueryData queryData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.black,
          ),
          child: Drawer(
            child: ListView(
              children: <Widget>[
                Container(
                  color: Colors.black,
                  child: DrawerHeader(
                    decoration: BoxDecoration(color: Colors.red),
                    child: Text(
                      'Ethin-APP',
                      style: TextStyle(
                        fontFamily: 'Pacifico',
                        fontSize: 40.0,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Machine Learning Task 1',
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/task1');
                  },
                ),
                ListTile(
                  title: Text(
                    'Machine Learning Task 2',
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/task2');
                  },
                ),
                ListTile(
                  title: Text(
                    'Logout',
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0),
                  ),
                  onTap: () async {
                    _auth.signOut();
                  },
                ),
              ],
            ),
          ),
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 50.0),
            child: Text(
              'This is an App that shows the Implementatons of Machine Learning using Flutter',
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0),
            )));
  }
}
