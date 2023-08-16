import 'package:brew_crew/screens/authenticateScreen/authenticate.dart';
import 'package:brew_crew/screens/homeScreen/home.dart';
import 'package:brew_crew/services/sign_in.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // return either home or authenticate widget, depending on whether user is signed in ot not

    // return Home();
    // return SignIn();
    return Authenticate();
  }
}
