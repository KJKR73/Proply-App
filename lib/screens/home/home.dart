import 'package:ethinicty_recognition_app/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  MediaQueryData queryData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.black,
        ),
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                padding: EdgeInsets.fromLTRB(0, 50, 0, 50),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30.0,
                    child: ClipOval(
                      child: Image.asset('assets/avatar.png'),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/avatar_back.jpg'),
                      fit: BoxFit.cover),
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              _createItems(
                'ML Task 1',
                () => {Navigator.pushNamed(context, '/task1')},
                Icons.track_changes,
              ),
              SizedBox(
                height: 10.0,
              ),
              _createItems(
                'ML Task 2',
                () => {Navigator.pushNamed(context, '/task2')},
                Icons.track_changes,
              ),
              SizedBox(
                height: 10.0,
              ),
              _createItems(
                'Log Out',
                () => {_auth.signOut()},
                Icons.exit_to_app,
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 50.0),
        child: Text(
          'APP TEXT',
          style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5),
        ),
      ),
    );
  }
}

Widget _createItems(String text, dynamic ontap, IconData icon) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(
          icon,
          size: 35.0,
          color: Colors.white,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(40, 5, 5, 5),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
    onTap: ontap,
  );
}
