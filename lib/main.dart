import 'package:flutter/material.dart';
import 'package:weapon_marketplace/views/screens/main.dart';


void main() {
  runApp(const MarketPlaceApp());
}

class MarketPlaceApp extends StatelessWidget {
  const MarketPlaceApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Weaponry',
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}