import 'package:brew_crew/screens/authenticateScreen/authenticate.dart';
import 'package:brew_crew/screens/homeScreen/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/userClass.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userDetails = Provider.of<UserClass?>(context);
    print(userDetails);


    // return either home or authenticate widget, depending on whether user is signed in ot not
    return userDetails == null ? Authenticate() : Home();
  }
}
