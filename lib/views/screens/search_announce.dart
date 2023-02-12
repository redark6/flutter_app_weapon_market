import 'package:flutter/material.dart';
import 'package:weapon_marketplace/models/announce.dart';

import '../../web_services/controllers/favorite_controller.dart';
import '../widgets/search_announce_item.dart';

class SearchAnnounceScreen extends StatefulWidget {
  const SearchAnnounceScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchAnnounceScreen> createState() => _SearchAnnounceScreenState();
}

class _SearchAnnounceScreenState extends State<SearchAnnounceScreen> {

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
                  body: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
                        child: Row(
                          children: [
                            const Expanded(
                                flex: 8,
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Rechercher un bien ...',
                                    hintText: 'Rechercher un bien ...',
                                  ),
                                ),
                            ),
                            Expanded(
                                flex: 2,
                                child: Center(
                                  child: IconButton(
                                      color: Colors.black,
                                      icon: const Icon(Icons.search),
                                      onPressed: () => {
                                        print("rien pr le moment")
                                      }
                                  ),
                                )
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        // The ListView
                        child: GridView.count(
                          crossAxisCount: 2,
                          children: [
                            for (var itemPost
                            in snapshot.data as List<Announce>)
                              SearchAnnounceItem(annnounce: itemPost),
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