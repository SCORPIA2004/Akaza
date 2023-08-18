import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Color(0x0E2E46FF),
      child: Center(
        child: SpinKitCubeGrid(
          color: Colors.blue,
          size: 50.0,
        ),
      ),
    );
  }
}