import 'package:flutter/material.dart';
import 'package:weapon_marketplace/screens/announce.dart';

void main() {
  runApp(const MarketPlaceApp());
}

class MarketPlaceApp extends StatelessWidget {
  const MarketPlaceApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Coding Pool',
      home: AnnounceScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}