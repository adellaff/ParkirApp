import 'package:flutter/material.dart';
import 'package:parkir_app/screens/login_screen.dart';

class HomePetugas extends StatefulWidget {
  @override
  _HomePetugasState createState() => _HomePetugasState();
}

class _HomePetugasState extends State<HomePetugas> {
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