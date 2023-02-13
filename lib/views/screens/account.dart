import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weapon_marketplace/services/auth_service.dart';
import 'package:weapon_marketplace/views/screens/login.dart';
import 'package:weapon_marketplace/views/screens/profil.dart';
import '../../models/user.dart';


import 'announce_gesture.dart';
import 'favorite_announce.dart';
import 'user_announce.dart';


class AccountScreen extends StatefulWidget {
  const AccountScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    final User? user = authService.getCurrentUser();

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text("Mon compte",
                  style: TextStyle(color: Colors.black, fontSize: 20.0,fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30,bottom: 60),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UserAnnounceScreen(userId: user.id)));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15,bottom: 15,left: 10, right: 10),
                            child: Row(
                              children: [
                            ClipRRect(
                            borderRadius: BorderRadius.circular(240),
                            child: user!.profilePictureUrl.isEmpty
                                ? Image.asset(
                              ('lib/assets/images/no_image.jpeg'),
                              width: 80,
                              height: 80,
                              fit: BoxFit.fill,)
                                : Image.memory(
                                base64.decode(user.profilePictureUrl),
                                width: 80,
                                height: 80,
                                fit: BoxFit.fill
                            ),
                          ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(user.username),
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.arrow_forward_sharp,
                                  color: Colors.deepOrange,
                                  size: 25,
                                ),
                              ],
                            ),
                          )
                      ),
                    )
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurpleAccent,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AnnounceGestureScreen()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15,bottom: 15,left: 10, right: 10),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.all_inbox_sharp,
                                  color: Colors.deepOrange,
                                  size: 25,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text('Annonces'),
                                ),
                              ],
                            ),
                          )
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurpleAccent,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const FavoriteAnnounceScreen(haveNavbar: true)));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15,bottom: 15,left: 10, right: 10),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.star,
                                  color: Colors.deepOrange,
                                  size: 25,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text('Favoris'),
                                ),
                              ],
                            ),
                          )
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurpleAccent,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ProfilScreen()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15,bottom: 15,left: 10, right: 10),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.person,
                                  color: Colors.deepOrange,
                                  size: 25,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text('Profil'),
                                ),
                              ],
                            ),
                          )
                      ),
                    )
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                          ),
                          onPressed: () {
                            authService.logout();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(top: 15,bottom: 15,left: 10, right: 10),
                            child: Text('Déconnexion',
                                style: TextStyle(color: Colors.deepOrange, fontSize: 15.0,fontWeight: FontWeight.bold)
                            ),
                          )
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}