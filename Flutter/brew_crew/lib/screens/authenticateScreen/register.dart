import 'package:flutter/material.dart';

import '../../services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleViewFunc;

  const Register({Key? key, required this.toggleViewFunc}) : super(key: key);
  // const Register({ required this.toggleViewFunc })

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final bgColorApp = const Color(0x0E2E46FF);
  final bgColorAppBar = const Color(0x0D528DFF);

  final AuthService _auth = AuthService();
  String email = "";
  String password = "";
  String reenter_password = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColorApp,
      appBar: AppBar(
        backgroundColor: bgColorAppBar,
        elevation: 0.0,
        title: Center(
          child: Text('Register to Brew Crew'),
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
                  TextFormField(
                    obscureText: true,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    decoration: InputDecoration(
                      hintText: 'Re-enter Password',
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
                      setState(() => reenter_password = value);
                    },
                  ),

                  SizedBox(height: 20.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(100, 40),
                    ),

                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    onPressed: () async
                    {
                      // todo: complete registration
                    },
                  ),

                  SizedBox(height: 20.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(100, 40),
                    ),

                    child: Text(
                      'Back',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    onPressed: ()
                    {
                      // todo: go back to sign in page
                      widget.toggleViewFunc();
                    },
                  ),
                ],
              ),
            )
        ),
      ),
    );;
  }
}
