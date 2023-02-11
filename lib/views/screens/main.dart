import 'package:flutter/material.dart';
import 'package:weapon_marketplace/views/screens/publish_announce.dart';
import 'package:weapon_marketplace/views/screens/search_announce.dart';

import 'account.dart';
import 'favorite_announce.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    SearchAnnounceScreen(),
    FavoriteAnnounceScreen(haveNavbar: false),
    FavoriteAnnounceScreen(haveNavbar: false),
    AccountScreen()
  ];

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
      // only scroll to top when current index is selected.
      /*
        if (_selectedIndex == index) {
          _homeController.animateTo(
            0.0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOut,
          );
        }

       */
        break;
      case 1:
      //showModal(context);
        break;
      case 2:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PublishAnnounceScreen()));
        break;
      case 3:
      //showModal(context);
        break;
    }
    setState(
          () {
        if(index != 2){
          _selectedIndex = index;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Rechercher',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border_outlined),
            label: 'Favoris',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: 'Publier',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_outlined),
            label: 'Compte',
            backgroundColor: Colors.black,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepOrange,
        onTap: _onItemTapped,
      ),
    );
  }
}
