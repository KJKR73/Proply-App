import 'package:ethinicty_recognition_app/services/auth.dart';
import 'package:flutter/material.dart';

// class Home extends StatelessWidget {
//   final AuthService _auth = AuthService();
//   MediaQueryData queryData;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         drawer: Theme(
//           data: Theme.of(context).copyWith(
//             canvasColor: Colors.black,
//           ),
//           child: Drawer(
//             child: ListView(
//               children: <Widget>[
//                 Container(
//                   color: Colors.black,
//                   child: DrawerHeader(
//                     decoration: BoxDecoration(
//                         color: Colors.red,
//                         border:
//                             Border(bottom: BorderSide(color: Colors.white))),
//                     child: Text(
//                       'Ethin-APP',
//                       style: TextStyle(
//                         fontFamily: 'Pacifico',
//                         fontSize: 40.0,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                       border: Border(bottom: BorderSide(color: Colors.white))),
//                   child: ListTile(
//                     title: Text(
//                       'Machine Learning Task 1',
//                       style: TextStyle(
//                           fontSize: 16.0,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           letterSpacing: 2.0),
//                     ),
//                     onTap: () {
//                       Navigator.pushNamed(context, '/task1');
//                     },
//                   ),
//                 ),
//                 ListTile(
//                   title: Text(
//                     'Machine Learning Task 2',
//                     style: TextStyle(
//                         fontSize: 16.0,
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         letterSpacing: 2.0),
//                   ),
//                   onTap: () {
//                     Navigator.pushNamed(context, '/task2');
//                   },
//                 ),
//                 ListTile(
//                   title: Text(
//                     'Logout',
//                     style: TextStyle(
//                         fontSize: 16.0,
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         letterSpacing: 2.0),
//                   ),
//                   onTap: () async {
//                     _auth.signOut();
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//         body: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 50.0),
//             child: Text(
//               'This is an App that shows the Implementatons of Machine Learning using Flutter',
//               style: TextStyle(
//                   fontSize: 20.0,
//                   color: Colors.red,
//                   fontWeight: FontWeight.bold,
//                   letterSpacing: 2.0),
//             )));
//   }
// }

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  MediaQueryData queryData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.white),
        child: Drawer(
          child: ListView(
            children: <Widget>[
              Container(
                color: Colors.white,
                child: DrawerHeader(
                  padding: EdgeInsetsDirectional.only(top: 60.0),
                  child: Text(
                    'APP TEST',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsetsDirectional.only(top: 5.0),
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.black),
                  ),
                ),
                child: ListTile(
                  title: Text(
                    'Machine learning task 1',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/task1');
                  },
                ),
              ),
              Container(
                padding: EdgeInsetsDirectional.only(top: 10.0),
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.black),
                  ),
                ),
                child: ListTile(
                  title: Text(
                    'Machine learning task 2',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/task2');
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.437,
              ),
              Container(
                padding: EdgeInsetsDirectional.only(top: 10.0),
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.black),
                    bottom: BorderSide(color: Colors.black),
                  ),
                ),
                child: ListTile(
                  title: Text(
                    'Log Out',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    _auth.signOut();
                  },
                ),
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
