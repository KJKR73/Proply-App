import 'package:firebase_auth/firebase_auth.dart';
import 'package:ethinicty_recognition_app/models/user.dart';

// All the authentication part for firebase happens here
class AuthService{
  // Create the instance of the firebase auth so that we can perform authenicaton
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create user from firebase user
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // Setup Stream for change of User
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  //Login Anonymously
  Future signInAnon() async {
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }
    catch(e){
      print('Error ${e.toString()}');
      return null;
    }
  }

  //Login with username and password

  //register with username and password

  // Sign Out
  Future signOut() async {
    try{
      return _auth.signOut();
    }
    catch(e){
      print('Could not Sign Out');
      print(e.toString());
    }
  }
}