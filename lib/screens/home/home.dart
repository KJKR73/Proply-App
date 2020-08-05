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
      backgroundColor: Colors.white,
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
        ),
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
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
                decoration: BoxDecoration(
                  color: Colors.blue[900],
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
                    color: Colors.blue[900],
                  ),
                ),
                height: 5.0,
              ),
              _createItemsSlider(
                'Go To Task1',
                () => {Navigator.pushNamed(context, '/task1')},
                Icons.track_changes,
              ),
              SizedBox(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.blue[900],
                  ),
                ),
                height: 5.0,
              ),
              _createItemsSlider(
                'Go To Task2',
                () => {Navigator.pushNamed(context, '/task2')},
                Icons.track_changes,
              ),
              SizedBox(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.blue[900],
                  ),
                ),
                height: 5.0,
              ),
              _createItemsSlider(
                'Log Out',
                () async {
                  await _auth.signOut();
                },
                Icons.exit_to_app,
              ),
              SizedBox(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.blue[900],
                  ),
                ),
                height: 5.0,
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            // color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0.0),
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.blue[900],
                  child: ListTile(
                    contentPadding: EdgeInsets.all(20),
                    title: Text(
                      'Home',
                      style: TextStyle(
                        fontSize: 32.0,
                        color: Colors.white,
                        fontFamily: 'Pacifico',
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                      ),
                    ),
                    trailing: CircleAvatar(
                      radius: 24.0,
                      child: ClipOval(
                        child: Image.asset('assets/avatar.png'),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 0),
                        child: ListTile(
                          title: Row(
                            children: <Widget>[
                              Icon(
                                Icons.track_changes,
                                color: Colors.blue[900],
                                size: 34,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '$appUseInfo',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 22.0,
                                  color: Colors.blue[900],
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      _createItems(
                        '1',
                        () => {Navigator.pushNamed(context, '/task1')},
                        Icons.computer,
                        'This task checks the presence of faces and give you a good text in return',
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      _createItems(
                        '2',
                        () => {Navigator.pushNamed(context, '/task2')},
                        Icons.computer,
                        'This task check the faces and outputs the face, race, age, and ethnicity of the persons in the picture',
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Swipe left for more --->',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.blue[900],
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _createItems(String text, dynamic ontap, IconData icon, String label) {
  return Padding(
    padding: EdgeInsets.only(left: 10, right: 20),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ButtonTheme(
        padding: EdgeInsets.all(0),
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          onPressed: ontap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.blue[100],
            ),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Container(
                    height: 150,
                    width: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage('assets/test2.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Align(
                      child: Text(
                        '$text',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 70.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    '$label',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Widget _createItemsSlider(String text, dynamic ontap, IconData icon) {
  return Container(
    color: Colors.white,
    child: ListTile(
      title: Row(
        children: <Widget>[
          Icon(
            icon,
            size: 35.0,
            color: Colors.blue[900],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(40, 5, 5, 5),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.blue[900],
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

class ClipTop extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 40.0);
    path.quadraticBezierTo(
        size.width / 6, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(size.width - (size.width / 6), size.height,
        size.width, size.height - 40.0);
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
