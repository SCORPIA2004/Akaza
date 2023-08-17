import 'package:brew_crew/screens/authenticateScreen/register.dart';
import 'package:brew_crew/services/sign_in.dart';
import 'package:flutter/material.dart';

import '../homeScreen/home.dart';

    class Authenticate extends StatefulWidget {
      @override
      State<Authenticate> createState() => _AuthenticateState();
    }

    class _AuthenticateState extends State<Authenticate> {
      bool showSignIn = true;
      toggleSignInRegisterView()
      {
        setState(() => showSignIn = !showSignIn );
      }

      @override
      Widget build(BuildContext context) {
        return Container(
            // child: Home()
            // child: SignIn()
          // child: Register()
          child: showSignIn ? SignIn(toggleViewFunc: toggleSignInRegisterView) : Register(toggleViewFunc: toggleSignInRegisterView)
        );
      }
    }
