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
  final bgColorFieldFill = const Color(0x0D528DFF);
  // import the ubuntu font
  final fontStyle = const TextStyle(fontFamily: 'Ubuntu');


  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String reenter_password = "";
  String errorMessage = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              key: _formKey,
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // Heading
                  SizedBox(height: 20.0),
                  Text("Glad you're here! 🙌", style: TextStyle(color: Colors.lightBlueAccent, fontSize: 20)),

                  // Email field
                  SizedBox(height: 20.0),
                  TextFormField (
                    // change color of text to white
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: bgColorFieldFill,
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
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: bgColorFieldFill,
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
                    validator: (value) => value!.length < 7 ? "Password should be >8 chars long" : null,

                    onChanged: (value)
                    {
                      setState(() => password = value);
                    },
                  ),

                  // Re-enter password field
                  SizedBox(height: 20.0),
                  TextFormField(
                    obscureText: true,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    decoration: InputDecoration(
                      hintText: 'Re-enter Password',
                      hintStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: bgColorFieldFill,
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
                    validator: (value) => value!.length < 7 ? "Password should be >8 chars long" : (password != reenter_password ? "Passwords don't match" : null),
                    onChanged: (value)
                    {
                      setState(() => reenter_password = value);
                    },
                  ),

                  // Error message
                  SizedBox(height: 20.0),
                  Text(
                      errorMessage,
                      style: TextStyle(color: Colors.red, fontSize: 15)
                  ),

                  // Register button
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
                      if(_formKey.currentState!.validate())                     // checks if email and password are entered in correct format or not
                      {
                        dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                        if(result == null)
                        {
                         setState(()=> errorMessage = "Invalid Email");
                        }
                      }
                    },
                  ),

                  // Back button
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(100, 40),
                      backgroundColor: Colors.redAccent,
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
