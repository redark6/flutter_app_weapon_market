import 'dart:io';

import 'package:flutter/material.dart';
import 'package:weapon_marketplace/services/http_override_localhost.dart';
import 'package:weapon_marketplace/views/screens/login.dart';


void main() {
  runApp(const MarketPlaceApp());
}

class MarketPlaceApp extends StatelessWidget {
  const MarketPlaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    HttpOverrides.global = MyHttpOverrides();

    return const MaterialApp(
      title: 'Airsoft Marketplace',
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
