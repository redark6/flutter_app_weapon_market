import 'package:flutter/material.dart';
import 'package:weapon_marketplace/models/announce.dart';
import 'package:weapon_marketplace/services/announce_service.dart';
import 'package:weapon_marketplace/services/auth_service.dart';

import '../../models/search.dart';
import '../../models/user.dart';
import '../../web_services/controllers/favorite_controller.dart';
import '../widgets/announce_gesture_item.dart';


class AnnounceGestureScreen extends StatefulWidget {
  AnnounceGestureScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AnnounceGestureScreen> createState() => _AnnounceGestureScreenState();
}

class _AnnounceGestureScreenState extends State<AnnounceGestureScreen> {
   int _int = 0;

  set callback(int value) => setState(() => {
    _int = value,
  });

  AnnounceService announceService = AnnounceService();
  AuthService authService = AuthService();
  late Future<List<Announce>> userAnnounces;

  @override
  Widget build(BuildContext context) {
    final User? user = authService.getCurrentUser();
    userAnnounces = announceService.getAnnounces(Search(null, null, null, null, user != null ? user.id : 0));


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
                  body:           ListView(
                    children: [
                      for (var itemPost
                      in snapshot.data as List<Announce>)
                        AnnounceGestureItem(announce: itemPost, callback: (val) => setState(() => _int = val)),
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