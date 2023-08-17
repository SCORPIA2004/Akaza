import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

const bgColorApp = const Color(0x0E2E46FF);
const bgColorAppBar = const Color(0x0D528DFF);

class SignIn extends StatefulWidget {

  @override

  _SignInState createState() => _SignInState();
}


class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColorApp,
      appBar: AppBar(
        backgroundColor: bgColorAppBar,
        elevation: 0.0,
        title: Center(
          child: Text('Sign in to Brew Crew'),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: ElevatedButton(
          child: Text("Sign in anon"),
          onPressed:() async {
            dynamic result = await _auth.signInAnon();
            if(result == null)
              print("Error signing in");
            else
            {
              print("Signed in");
              // print("USER UID is: " + result.uid);

            }
          }
        ),
      ),
    );
  }
}