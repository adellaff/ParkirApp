import 'package:flutter/material.dart';
import 'package:parkir_app/screens/admin_screen.dart';
import 'package:parkir_app/screens/report_admin_screen.dart';
import 'package:parkir_app/screens/profile_admin_screen.dart';

class AdminBottomTab extends StatefulWidget {
  @override
  _AdminBottomTabState createState() => _AdminBottomTabState();
}

class _AdminBottomTabState extends State<AdminBottomTab> {
  final List<Map<String, dynamic>> _pages = [
    {'page': AdminScreen(), 'title': 'Home'},
    {'page': ReportAdmin(), 'title': 'Report'},
    {'page': ProfileAdmin(), 'title': 'Profile'}
  ];

  int _selectedIndex = 0;

  void _onSelectPage(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {

    return DefaultTabController( 
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(_pages[_selectedIndex]['title']),
        ),
        body: (_pages[_selectedIndex]['page']),
        bottomNavigationBar: BottomNavigationBar( 
          onTap: _onSelectPage,
          backgroundColor: Colors.lightBlueAccent,
          unselectedItemColor: Colors.grey[600],
          selectedItemColor: Colors.blue,
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home')  
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              title: Text('Report')  
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.perm_identity),
              title: Text('Profile')  
            ),
          ],
        ),
      ),
    );
  }
}