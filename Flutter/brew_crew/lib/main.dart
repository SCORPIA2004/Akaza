import 'package:brew_crew/models/userClass.dart';
import 'package:brew_crew/screens/wrapper.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'models/userClass.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserClass?>.value(
      // StreamProvider listening to userAuthenticationChanged method and wrapping up the MaterialApp, so any descendents of MaterialApp can access the data
      value: AuthService().userAuthenticationChanged,
      initialData: null,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}