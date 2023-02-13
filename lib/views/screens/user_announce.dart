import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weapon_marketplace/models/announce.dart';
import 'package:weapon_marketplace/services/auth_service.dart';

import '../../models/search.dart';
import '../../models/user.dart';
import '../../services/announce_service.dart';
import '../widgets/user_announce_item.dart';

class UserAnnounceScreen extends StatefulWidget {
  final int userId;
  const UserAnnounceScreen({
    Key? key, required this.userId
  }) : super(key: key);

  @override
  State<UserAnnounceScreen> createState() => _UserAnnounceScreenState();
}

class _UserAnnounceScreenState extends State<UserAnnounceScreen> {

  late Future<List<Announce>> userAnnounces;


  @override
  Widget build(BuildContext context) {
    AnnounceService announceService = AnnounceService();
    AuthService authService = AuthService();
    userAnnounces = announceService.getAnnounces(Search(null, null, null, null, widget.userId));
    User? user = authService.getCurrentUser();
    return FutureBuilder(
        future: userAnnounces,
        builder: (BuildContext context,
            AsyncSnapshot<List<Announce>> snapshot) {
          return snapshot.data != null
              ?
          SafeArea(
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
                  body: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
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
                              child: Text(user.username,
                                  style: const TextStyle(color: Colors.black, fontSize: 20.0,fontWeight: FontWeight.bold)
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        // The ListView
                        child: GridView.count(
                          crossAxisCount: 2,
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 1.6),
                          children: [
                            for (var itemPost
                            in snapshot.data as List<Announce>)
                              UserAnnounceItem(announce: itemPost),
                          ],
                        ),
                      ),
                    ],
                  )
              )
          )
              : Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(
                color: Colors.deepOrange,
              ));
        });
  }
}