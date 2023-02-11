import 'package:flutter/material.dart';
import 'package:weapon_marketplace/models/announce.dart';

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
                  appBar: AppBar(
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
                  ),
                  body:           ListView(
                    children: [
                      for (var itemPost
                      in snapshot.data as List<Announce>)
                        AnnounceGestureItem(annnounce: itemPost),
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