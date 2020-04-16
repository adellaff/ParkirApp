import 'package:flutter/material.dart';
import 'package:parkir_app/screens/login_screen.dart';

class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text('LOGOUT'),
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder:(context) {
            return LoginScreen();
          }));
        }
        ),
    );
  }
}
