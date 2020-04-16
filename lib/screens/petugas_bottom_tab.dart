import 'package:flutter/material.dart';
import 'package:parkir_app/screens/home_petugas_screen.dart';
import 'package:parkir_app/screens/profile_petugas_screen.dart';

class PetugasBottomTab extends StatefulWidget {
  @override
  _PetugasBottomTabState createState() => _PetugasBottomTabState();
}

class _PetugasBottomTabState extends State<PetugasBottomTab> {
  final List<Map<String, dynamic>>_pages = [
    {'page': HomePetugas(), 'title': 'Home'},
    {'page': ProfilePetugas(), 'title': 'Profile'},

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
      length: 2,
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
              icon: Icon(Icons.perm_identity),
              title: Text('Profile')  
            ),
          ],
        ),
      ),
    );
  }
}