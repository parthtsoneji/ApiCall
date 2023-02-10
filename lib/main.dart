import 'package:apicall/HomeScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/home',
    routes: {
      '/home' : (context) => HomeScreen()
    },
  ));
}
