import 'package:flutter/material.dart';
import 'package:parkir_app/screens/login_screen.dart';
// import 'package:parkir_app/screens/parkir_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parkir App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}