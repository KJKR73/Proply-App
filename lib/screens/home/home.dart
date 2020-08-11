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
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var factorHeight = 1 / 740.0 * height;
    var factorWidth = 1 / 360.0 * width;
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.black,
        ),
        child: Container(
          height: height,
          width: factorWidth * 300,
          child: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  padding: EdgeInsets.fromLTRB(0, factorHeight * 25, 0, 0),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: 5,
                          child: CircleAvatar(
                            radius: factorHeight * 30.0,
                            child: ClipOval(
                              child: Image.asset('assets/avatar.png'),
                            ),
                          ),
                        ),
                        SizedBox(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.black,
                            ),
                          ),
                          height: factorHeight * 15.0,
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            '$username',
                            style: TextStyle(
                              color: Colors.blue[700],
                              fontSize: factorHeight * 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: factorHeight * 10,
                        )
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                _createItemsSlider(
                  'Go To Task1',
                  () => {Navigator.pushNamed(context, '/task1')},
                  Icons.track_changes,
                  factorHeight,
                  factorWidth,
                ),
                SizedBox(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                  ),
                  height: factorHeight * 5.0,
                ),
                _createItemsSlider(
                  'Go To Task2',
                  () => {Navigator.pushNamed(context, '/task2')},
                  Icons.track_changes,
                  factorHeight,
                  factorWidth,
                ),
                SizedBox(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                  ),
                  height: factorHeight * 5.0,
                ),
                _createItemsSlider(
                  'Log Out',
                  () async {
                    await _auth.signOut();
                  },
                  Icons.exit_to_app,
                  factorHeight,
                  factorWidth,
                ),
                SizedBox(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                  height: factorHeight * 1.0,
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.blue[900],
                  child: ListTile(
                    contentPadding: EdgeInsets.all(factorHeight * 20),
                    title: Text(
                      'Home',
                      style: TextStyle(
                        fontSize: factorHeight * 36.0,
                        color: Colors.black,
                        fontFamily: 'Pacifico',
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                      ),
                    ),
                    trailing: CircleAvatar(
                      radius: factorHeight * 28.0,
                      backgroundColor: Colors.black,
                      child: ClipOval(
                        child: Image.asset('assets/avatar.png'),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: factorHeight * 30.0,
              ),
              Expanded(
                flex: 5,
                child: Container(
                  color: Colors.black,
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
                                size: factorHeight * 34,
                              ),
                              SizedBox(
                                width: factorHeight * 10,
                              ),
                              Text(
                                '$appUseInfo',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: factorHeight * 22.0,
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
                        height: factorHeight * 5.0,
                      ),
                      Expanded(
                        flex: 1,
                        child: _createItems(
                            '1',
                            () => {Navigator.pushNamed(context, '/task1')},
                            Icons.computer,
                            'This task checks the presence of faces and give you a good text in return',
                            factorHeight,
                            factorWidth),
                      ),
                      SizedBox(
                        height: factorHeight * 30.0,
                      ),
                      Expanded(
                        flex: 1,
                        child: _createItems(
                          '2',
                          () => {Navigator.pushNamed(context, '/task2')},
                          Icons.computer,
                          'This task check the faces and outputs the face, race, age, and ethnicity of the persons in the picture',
                          factorHeight,
                          factorWidth,
                        ),
                      ),
                      SizedBox(
                        height: factorHeight * 30,
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Swipe left for more --->',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: factorHeight * 16.0,
                            color: Colors.blue[900],
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _createItems(
  String text,
  dynamic ontap,
  IconData icon,
  String label,
  var factorHeight,
  var factorWidth,
) {
  return Padding(
    padding: EdgeInsets.only(left: factorHeight * 10, right: factorWidth * 20),
    child: Container(
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(factorHeight * 15),
      ),
      child: ButtonTheme(
        padding: EdgeInsets.all(0),
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(factorHeight * 15.0),
          ),
          onPressed: ontap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(factorHeight * 15),
              color: Colors.blue[100],
            ),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Container(
                    height: factorHeight * 150,
                    width: factorWidth * 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(factorHeight * 15),
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
                          fontSize: factorHeight * 70.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: factorHeight * 10,
                ),
                Expanded(
                  child: Text(
                    '$label',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: factorHeight * 17.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: factorHeight * 10,
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Widget _createItemsSlider(
  String text,
  dynamic ontap,
  IconData icon,
  var factorHeight,
  var factorWidth,
) {
  return Container(
    color: Colors.black,
    child: ListTile(
      title: Row(
        children: <Widget>[
          Icon(
            icon,
            size: factorHeight * 35.0,
            color: Colors.blue[700],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              factorHeight * 40,
              factorHeight * 5,
              factorHeight * 5,
              factorHeight * 5,
            ),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.blue[700],
                fontSize: factorHeight * 17.0,
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
