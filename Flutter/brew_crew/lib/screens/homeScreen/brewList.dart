import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/brew.dart';

class BrewList extends StatefulWidget {
  const BrewList({Key? key}) : super(key: key);

  @override
  State<BrewList> createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {

    final brews = Provider.of<List<Brew>?>(context);
    // print(brews.documents);
    print("WHY NOT PRINTING???");
    if(brews != null)
      {
        brews.forEach((thisBrew)
        {
          print(thisBrew.name);
          print(thisBrew.sugars);
          print(thisBrew.strength);
        });
      }

    return Container();
  }
}
