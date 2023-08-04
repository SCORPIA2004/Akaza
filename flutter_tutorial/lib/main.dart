import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        title: Text("Yo"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        ),
      body: Center(
        child: Text(
          "Hello Flutter",
          style: TextStyle(
            color: Colors.white,
            fontSize: 50.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text("+"),
        backgroundColor: Colors.indigo,
      ),
    ),
    ),
  );    // runApp

}

class test extends StatelessWidget {
  const test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
