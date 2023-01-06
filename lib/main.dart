
import 'package:flutter/material.dart';
import 'package:singular_editor/mobile.dart';
void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/':(context) => Mobile()
    },
  )
  );
}