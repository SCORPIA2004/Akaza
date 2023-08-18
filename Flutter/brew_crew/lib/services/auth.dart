import 'package:brew_crew/models/userClass.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'database.dart';

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
  Future signInWithEmailAndPassword(String email, String password) async
  {
    try
    {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;

      // create a new document for the user with the uid
      await DatabaseService(uid: user!.uid).updateUserData(email, user.uid, "0", "new crew member", 100);

      return _userFromFirebaseUser(user);
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }


  // register with email and password
  Future registerWithEmailAndPassword(String email, String password) async
  {
    try
    {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
    return null;
}

  // sign out
  Future signUserOut() async
  {
    try
    {
      return await _auth.signOut();
    }
    catch(e)
    {
      print("Error signing out");
      print(e.toString());
      return null;
    }
  }

}