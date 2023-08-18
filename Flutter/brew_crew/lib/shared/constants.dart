import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  hintText: '',
  hintStyle: TextStyle(color: Colors.white),
  filled: true,
  fillColor: Color(0x0D528DFF),
  enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
          color: Colors.white,
          width: 1.0
      )
  ),
  focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
          color: Colors.blue,
          width: 1.0
      )
  ),
);
