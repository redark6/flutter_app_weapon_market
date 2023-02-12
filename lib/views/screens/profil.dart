import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weapon_marketplace/services/auth_service.dart';

import '../../models/user.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    final User? user = authService.getCurrentUser();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_sharp,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: false,
          elevation: 2,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "Mon compte",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 15, left: 10, right: 10),
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
                                      base64.decode(user!.profilePictureUrl),
                                      width: 80,
                                      height: 80,
                                      fit: BoxFit.fill
                                    ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                user != null
                                    ? user.username
                                    : "nom d'utilisateur",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 5, bottom: 15),
                child: Divider(
                  color: Colors.black,
                  height: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 15, left: 10, right: 10),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.person,
                              color: Colors.deepOrange,
                              size: 25,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                user != null
                                    ? user.username
                                    : "nom d'utilisateur",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 15, left: 10, right: 10),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.phone_enabled,
                              color: Colors.deepOrange,
                              size: 25,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                user != null ? user.phone : '0645821584',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 15, left: 10, right: 10),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.mail,
                              color: Colors.deepOrange,
                              size: 25,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                user != null ? user.email : 'truc@truc.fr',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
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
