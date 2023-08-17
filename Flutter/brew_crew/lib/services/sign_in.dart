import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

const bgColorApp = const Color(0x0E2E46FF);
const bgColorAppBar = const Color(0x0D528DFF);

class SignIn extends StatefulWidget {

  @override

  _SignInState createState() => _SignInState();
}


class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColorApp,
      appBar: AppBar(
        backgroundColor: bgColorAppBar,
        elevation: 0.0,
        title: Center(
          child: Text('Sign in to Brew Crew'),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Center(
          child: Form(
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  // change color of text to white
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)
                    ),
                  ),
                  onChanged: (value)
                  {
                      setState(() => email = value);
                  },
                ),

                SizedBox(height: 20.0),
                TextFormField(
                  obscureText: true,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)
                    ),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)
                    ),
                  ),
                  onChanged: (value)
                  {
                    setState(() => password = value);
                  },
                ),

                SizedBox(height: 20.0),
                ElevatedButton(
                    // set width of button to 50
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(100, 40),
                    ),
                    child: Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  onPressed: () async
                  {
                    print("Email: $email");
                    print("Password: $password");
                  },
                ),

                SizedBox(height: 20.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(100, 40),
                  ),

                  child: Text(
                    'Sign up',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                  onPressed: () async
                  {
                  //  Todo: go to register screen
                  },
                ),

              ],
            ),
          )
        ),
      ),
    );
  }
}