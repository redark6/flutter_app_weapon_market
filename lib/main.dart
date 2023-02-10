import 'dart:io';

import 'package:flutter/material.dart';
import 'package:weapon_marketplace/screens/announce.dart';
import 'package:weapon_marketplace/screens/login.dart';
import 'package:weapon_marketplace/services/auth_service.dart';
import 'package:weapon_marketplace/services/http_override_localhost.dart';

void main() {
  runApp(const MarketPlaceApp());
}

class MarketPlaceApp extends StatelessWidget {
  const MarketPlaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    HttpOverrides.global = MyHttpOverrides();

    return MaterialApp(
      title: 'Connexion',
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
