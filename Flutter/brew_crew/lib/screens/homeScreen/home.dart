import 'package:brew_crew/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/services/database.dart';
import 'package:provider/provider.dart';
import "package:brew_crew/services/auth.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import 'brewList.dart';

const bgColorApp = const Color(0x0E2E46FF);
const bgColorAppBar = const Color(0x0D528DFF);

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot?>.value(
      value: DatabaseService(uid: '').brews,
      initialData: null,

      child: Scaffold(
        backgroundColor: bgColorApp,
        appBar: AppBar(
          title: Text("Brew Crew"),
          backgroundColor: bgColorAppBar,
          elevation: 0.0,
          actions: <Widget>[
          TextButton.icon(
              onPressed: () async
              {
                print(_auth.toString());
                await _auth.signUserOut();
              },
              icon: Icon(Icons.exit_to_app),
              label: Text(""))
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}
