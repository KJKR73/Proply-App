import 'package:ethinicty_recognition_app/screens/authenticate/register.dart';
import 'package:ethinicty_recognition_app/screens/authenticate/sign_in.dart';
import 'package:ethinicty_recognition_app/services/auth.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  //bool auto = false;
  final AuthService _auth = AuthService();
  // Future autoLogin() async {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   SharedPreferences prefs = await SharedPreferences.getInstance();  
  //   String email = prefs.getString('email') ?? '';
  //   String password = prefs.getString('password') ?? '';
  //   if (email == '' || password == ''){
  //     this.auto = true;
  //   }
  //   return {'email' : email,
  //     'password' : password};
  // }
  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: showSignIn ? SignIn(toggleView: toggleView) : Register(toggleView: toggleView),
    );
  }
}