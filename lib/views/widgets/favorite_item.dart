import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weapon_marketplace/services/announce_service.dart';
import 'package:weapon_marketplace/services/date_service.dart';

import '../../models/announce.dart';
import '../screens/announce.dart';

class FavoriteItem extends StatelessWidget {
  final Announce announce;
  final Function callback;

  const FavoriteItem({
    Key? key,
    required this.announce,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AnnounceService announceService = AnnounceService();
    DateService dateService = DateService();

    Widget cancelButton = TextButton(
      child: const Text("Annuler"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Continuer"),
      onPressed: () {
        announceService
            .deleteFavorite(announce.id, announce.userId)
            .then((value) => {callback(1), Navigator.of(context).pop()});
      },
    );
    AlertDialog alert = AlertDialog(
      title: const Text("Attention"),
      content: const Text("Voulez vous supprimer ce favori ?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AnnounceScreen(announce: announce))),
      child: Card(
        child: ListTile(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 110,
                width: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: announce.image.isEmpty
                      ? Image.asset(
                          'lib/assets/images/no_image.jpeg',
                          height: 100,
                          width: 100,
                          fit: BoxFit.fill,
                        )
                      : Image.memory(
                          base64.decode(announce.image),
                          height: 100,
                          width: 100,
                          fit: BoxFit.fill,
                        ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: (MediaQuery.of(context).size.height / 5.8),
                        child: Text(
                          announce.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      ),
                      IconButton(
                          //
                          color: Colors.deepOrange,
                          icon: const Icon(Icons.star),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return alert;
                              },
                            );
                          }),
                    ],
                  ),
                  Text(
                    announce.getPrice(),
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                      width: (MediaQuery.of(context).size.height / 4),
                      child: Text(
                        overflow: TextOverflow.fade,
                        softWrap: true,
                        maxLines: 2,
                        announce.location,
                        style: const TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 14),
                      ),
                    ),
                  ),
                  Text(
                    dateService.formatDate(announce.date),
                    style: const TextStyle(
                        fontWeight: FontWeight.normal, fontSize: 14),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
