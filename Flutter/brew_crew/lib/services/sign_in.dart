import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/shared/constants.dart';
import 'package:brew_crew/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';



class SignIn extends StatefulWidget {
  final Function toggleViewFunc;
  const SignIn({required this.toggleViewFunc});
  // const Register({ required this.toggleViewFunc })

  @override
  _SignInState createState() => _SignInState();
}


class _SignInState extends State<SignIn> {

  final bgColorApp = const Color(0x0E2E46FF);
  final bgColorAppBar = const Color(0x0D528DFF);
  final bgColorFieldFill = const Color(0x0D528DFF);

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = "";
  String password = "";
  String errorMessage = "";

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      resizeToAvoidBottomInset: false,
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
            key: _formKey,
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // Heading
                SizedBox(height: 20.0),
                Text("Welcome back 👋", style: TextStyle(color: Colors.lightBlueAccent, fontSize: 20)),

                // Email field
                SizedBox(height: 20.0),
                TextFormField (
                  // change color of text to white
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  decoration: textInputDecoration.copyWith(hintText: 'Email'),
                  validator: (value) => value!.isEmpty ? "Email can't be empty" : null,
                  onChanged: (value)
                  {
                    setState(() => email = value);
                  },
                ),

                // Password field
                SizedBox(height: 20.0),
                TextFormField(
                  obscureText: true,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  decoration: textInputDecoration.copyWith(hintText: 'Password'),
                  validator: (value) => value!.length < 7 ? "Password should be >8 chars long" : null,
                  onChanged: (value)
                  {
                    setState(() => password = value);
                  },
                ),

                // Error message
                SizedBox(height: 20.0),
                Text(
                    errorMessage,
                    style: TextStyle(color: Colors.red, fontSize: 15)
                ),

                // Sign in button
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
                    // todo: complete sign in with email address and password
                    if(_formKey.currentState!.validate())                     // checks if email and password are entered in correct format or not
                    {
                      setState(() => loading = true);
                      print("Signed in");
                      dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                      if(result == null)
                      {
                        setState(()
                        {
                          errorMessage = "Invalid Username or Password";
                          loading = false;
                        });
                        // setState(() => loading = false);
                      }
                    }

                  },
                ),

                // Register button
                SizedBox(height: 20.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(100, 40),
                    backgroundColor: Colors.redAccent,
                  ),

                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                  onPressed: () {
                  //  Todo: go to register screen video#12
                    widget.toggleViewFunc();
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