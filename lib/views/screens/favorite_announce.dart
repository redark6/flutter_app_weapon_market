import 'package:flutter/material.dart';
import 'package:weapon_marketplace/models/announce.dart';
import 'package:weapon_marketplace/services/announce_service.dart';
import 'package:weapon_marketplace/services/auth_service.dart';

import '../../models/user.dart';
import '../widgets/favorite_item.dart';


class FavoriteAnnounceScreen extends StatefulWidget {
  final bool haveNavbar;
  const FavoriteAnnounceScreen({
    Key? key, required this.haveNavbar,
  }) : super(key: key);

  @override
  State<FavoriteAnnounceScreen> createState() => _FavoriteAnnounceScreenState();

}

class _FavoriteAnnounceScreenState extends State<FavoriteAnnounceScreen> {

  AuthService authService = AuthService();
  AnnounceService annonceService = AnnounceService();
  late Future<List<Announce>> favoriteAnnounce;

  set callback(int value) => setState(() => {});

  @override
  Widget build(BuildContext context) {
    User? user = authService.getCurrentUser();
    favoriteAnnounce = annonceService.getFavoriteAnnounces(user != null ? user.id : 0);

    return FutureBuilder(
        future: favoriteAnnounce,
        builder: (BuildContext context,
            AsyncSnapshot<List<Announce>> snapshot) {
          return snapshot.data != null
              ?
              SafeArea(
                  child: Scaffold(
                      appBar: widget.haveNavbar ? AppBar(
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
                      ) : null,
                      body:           ListView(
                        children: [
                          for (var itemPost
                          in snapshot.data as List<Announce>)
                            FavoriteItem(announce: itemPost, callback: (val) => setState(() => {})),
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