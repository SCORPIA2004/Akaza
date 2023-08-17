import 'package:brew_crew/models/userClass.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService
{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user object based on firebase user return data
  UserClass? _userFromFirebaseUser(User? user)
  {
      // initialise an instance of User
      return user != null ? UserClass(uid: user.uid) : null;
  }

  Stream <UserClass?> get userAuthenticationChanged
  {
    return _auth.authStateChanges()
        // .map((User? userThis) => _userFromFirebaseUser(userThis));           --> same as next line
        .map(_userFromFirebaseUser);
  }


  //  sign in anon
  Future signInAnon() async
  {
    try
    {
      // AuthResult result = await _auth.signInAnonymously();     --> deprecated
      UserCredential result = await _auth.signInAnonymously();
      // FirebaseUser user = result.user;                         --> deprecated
      User? user = result.user;
      return _userFromFirebaseUser(user);
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }


  // sign in with email and password

  // register with email and password

  // sign out

}