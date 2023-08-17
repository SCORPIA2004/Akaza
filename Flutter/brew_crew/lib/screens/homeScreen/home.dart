import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';
import "package:brew_crew/services/auth.dart";
const bgColorApp = const Color(0x0E2E46FF);
const bgColorAppBar = const Color(0x0D528DFF);

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColorApp,
      appBar: AppBar(
        title: Center(
          child: Text("Brew Crew"),
        ),
        backgroundColor: bgColorAppBar,
        elevation: 0.0,
        actions: <Widget>[
        TextButton.icon(
            onPressed: () async
            {
              await _auth.signUserOut();
            },
            icon: Icon(Icons.exit_to_app),
            label: Text(""))
        ],
      ),
    );
  }
}
