import 'package:cloud_firestore/cloud_firestore.dart';

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
}