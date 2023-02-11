import 'package:flutter/material.dart';
import 'package:weapon_marketplace/models/announce.dart';

import '../../web_services/controllers/favorite_controller.dart';
import '../widgets/user_announce_item.dart';

class UserAnnounceScreen extends StatefulWidget {
  final int userId;
  UserAnnounceScreen({
    Key? key, required this.userId
  }) : super(key: key);

  @override
  State<UserAnnounceScreen> createState() => _UserAnnounceScreenState();
}

class _UserAnnounceScreenState extends State<UserAnnounceScreen> {

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
                  body: Column(
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 35, // Image radius
                                backgroundImage: AssetImage('lib/assets/images/no_image.jpeg'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text("Nom du vendeur",
                                    style: TextStyle(color: Colors.black, fontSize: 20.0,fontWeight: FontWeight.bold)
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        // The ListView
                        child: GridView.count(
                          crossAxisCount: 2,
                          children: [
                            for (var itemPost
                            in snapshot.data as List<Announce>)
                              UserAnnounceItem(annnounce: itemPost),
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