import 'package:ethinicty_recognition_app/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  final username;
  final String appUseInfo = "Tasks";
  Home({this.username});
  MediaQueryData queryData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color(0xFF223843),
        ),
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 30.0,
                          child: ClipOval(
                            child: Image.asset('assets/avatar.png'),
                          ),
                        ),
                        SizedBox(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Color(0xFFFC5A58),
                            ),
                          ),
                          height: 15.0,
                        ),
                        Text(
                          '$username',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/avatar_back.jpg'),
                    fit: BoxFit.cover,
                  ),
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Color(0xFF223843),
                  ),
                ),
                height: 10.0,
              ),
              _createItems(
                'ML Task 1',
                () => {Navigator.pushNamed(context, '/task1')},
                Icons.track_changes,
                Colors.black,
              ),
              SizedBox(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Color(0xFF223843),
                  ),
                ),
                height: 10.0,
              ),
              _createItems(
                'ML Task 2',
                () => {Navigator.pushNamed(context, '/task2')},
                Icons.track_changes,
                Colors.black,
              ),
              SizedBox(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Color(0xFF223843),
                  ),
                ),
                height: 10.0,
              ),
              _createItems(
                'Log Out',
                () => {_auth.signOut()},
                Icons.exit_to_app,
                Colors.black,
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black,
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0.0),
          child: Column(
            children: <Widget>[
              Container(
                height: 170,
                color: Color(0xFFF5336F),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5, 40, 0, 0),
                    child: Text(
                      'Ethnicity app',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 50.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '$appUseInfo',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              _createItems(
                'ML Task 1',
                () => {Navigator.pushNamed(context, '/task1')},
                Icons.computer,
                Color(0xFFFF7149),
              ),
              SizedBox(
                height: 30.0,
              ),
              _createItems(
                'ML Task 2',
                () => {Navigator.pushNamed(context, '/task2')},
                Icons.computer,
                Color(0xFFFF7149),
              ),
              SizedBox(
                height: 70,
              ),
              Text(
                'Swipe left -------->',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _createItems(String text, dynamic ontap, IconData icon, dynamic color) {
  return Container(
    color: color,
    child: ListTile(
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
    ),
  );
}
