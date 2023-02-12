import 'package:flutter/material.dart';
import 'package:weapon_marketplace/models/announce.dart';
import 'package:weapon_marketplace/models/search.dart';
import 'package:weapon_marketplace/services/announce_service.dart';

import '../../web_services/controllers/favorite_controller.dart';
import '../widgets/search_announce_item.dart';

class SearchAnnounceScreen extends StatefulWidget {
  final String? title;
  const SearchAnnounceScreen({
    Key? key, this.title,
  }) : super(key: key);

  @override
  State<SearchAnnounceScreen> createState() => _SearchAnnounceScreenState();
}

class _SearchAnnounceScreenState extends State<SearchAnnounceScreen> {

  AnnounceService announceService = AnnounceService();
  late Future<List<Announce>> favoriteAnnounce;

  static const _pageSize = 1;
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(widget.title);
    favoriteAnnounce = announceService.getAnnounces(Search(widget.title, null, null, null, null));
    emailController.text = (widget.title ?? '')!;

    _search() {
      Navigator.push(context,MaterialPageRoute(builder: (context) => SearchAnnounceScreen(title: emailController.text,)));
    }
    return FutureBuilder(
        future: favoriteAnnounce,
        builder: (BuildContext context,
            AsyncSnapshot<List<Announce>> snapshot) {
          return snapshot.data != null ?
          SafeArea(
              child: Scaffold(
                  body: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
                        child: Row(
                          children: [
                             Expanded(
                                flex: 8,
                                child: TextField(
                                  controller: emailController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Rechercher un bien ...',
                                    hintText: 'Rechercher un bien ...',
                                  ),
                                  onSubmitted: (value) {
                                    _search();
                                  },
                                ),
                            ),
                            Expanded(
                                flex: 2,
                                child: Center(
                                  child: IconButton(
                                      color: Colors.black,
                                      icon: const Icon(Icons.search),
                                      onPressed: () => {
                                        _search()
                                      }
                                  ),
                                )
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        // The ListView
                        child:  (snapshot.data?.isNotEmpty)! ? GridView.count(
                          crossAxisCount: 2,
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 1.3),
                          children: [
                            for (var itemPost
                            in snapshot.data as List<Announce>)
                              SearchAnnounceItem(announce: itemPost),
                          ],
                        ) : Text("Pas d'annonces trouvés"),
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