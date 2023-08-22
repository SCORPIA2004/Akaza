import 'package:brew_crew/screens/homeScreen/brewList.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/brew.dart';

class DatabaseService
{
  // collection reference
  final CollectionReference brewCollection = FirebaseFirestore.instance.collection("brews");
  final String uid;
  DatabaseService({required this.uid});

  Future updateUserData(String email, String uidSent, String sugars, String name, int strength) async
  {
    return await brewCollection.doc(uid).set({
      "email": email,
      "uid": uidSent,
      "sugars": sugars,
      "name": name,
      "strength": strength
    });
  }

  // get brews list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot)
  {
    return snapshot.docs.map((doc)
    {
      return Brew(
        name: doc["name"] ?? "",
        sugars: doc["sugars"] ?? "0",
        strength: doc["strength"] ?? 0,
      );
    }).toList();
  }

  Stream<List<Brew>> get brews
  {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }

}