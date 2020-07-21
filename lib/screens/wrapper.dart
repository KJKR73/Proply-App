import 'package:ethinicty_recognition_app/models/user.dart';
import 'package:ethinicty_recognition_app/screens/authenticate/authenticate.dart';
import 'package:ethinicty_recognition_app/screens/authenticate/register.dart';
import 'package:ethinicty_recognition_app/screens/authenticate/sign_in.dart';
import 'package:ethinicty_recognition_app/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// The Wrapper class has the function to changed state between the Home() and
// the Authenticate Widgets.
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return user == null
        ? Authenticate()
        : Home(
            username: user.name,
          );
  }
}
