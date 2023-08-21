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
const bgColorProfilePicture = const Color(0x36a1ffFF);

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  final TextEditingController iconController = TextEditingController();

  @override

  // Testing starts
  final List<DropdownMenuEntry> widgetEntries = <DropdownMenuEntry<Widget>>[
    // DropdownMenu(
    //   controller: iconController,
    //   enableFilter: true,
    //   leadingIcon: const Icon(Icons.search),
    //   dropdownMenuEntries: widgetEntries,
    //   inputDecorationTheme: const InputDecorationTheme(
    //     filled: true,
    //     contentPadding: EdgeInsets.symmetric(vertical: 5.0),
    //   ),
    // ),
    DropdownMenuEntry<Widget>(
        value: CircleAvatar(
          backgroundColor: bgColorProfilePicture,
          child: const Text('AH', style: TextStyle(fontSize: 18, color: Colors.white)),
        ),
        label: "label",
        ),
  ];

  // widgetEntries.add(DropdownMenuEntry<Widget>());
  // Testing ends


  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot?>.value(
      value: DatabaseService(uid: '').brews,
      initialData: null,

      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
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
                label: Text("")),
              CircleAvatar(
                backgroundColor: bgColorProfilePicture,
                child: const Text('AH', style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ],
          ),
          body: Text(BrewList().toString(), style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}