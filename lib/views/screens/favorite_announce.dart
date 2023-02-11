import 'package:flutter/material.dart';
import 'package:weapon_marketplace/models/announce.dart';

import '../../web_services/controllers/favorite_controller.dart';
import '../widgets/favorite_item.dart';


class FavoriteAnnounceScreen extends StatefulWidget {
  final bool haveNavbar;
  FavoriteAnnounceScreen({
    Key? key, required this.haveNavbar,
  }) : super(key: key);

  @override
  State<FavoriteAnnounceScreen> createState() => _FavoriteAnnounceScreenState();
}

class _FavoriteAnnounceScreenState extends State<FavoriteAnnounceScreen> {

  FavoriteController favoriteAnnounceController = FavoriteController();
  late Future<List<Announce>> favoriteAnnounce;

  @override
  Widget build(BuildContext context) {

    favoriteAnnounce = favoriteAnnounceController.getFavoriteAnnounces();

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
                          icon: Icon(
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
                            FavoriteItem(annnounce: itemPost),
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