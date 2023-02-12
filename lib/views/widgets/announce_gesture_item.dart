import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weapon_marketplace/services/announce_service.dart';
import 'package:weapon_marketplace/services/auth_service.dart';
import 'package:weapon_marketplace/services/date_service.dart';

import '../../models/announce.dart';

class AnnounceGestureItem extends StatelessWidget {
  final Announce announce;
  final Function callback;

  const AnnounceGestureItem({
    Key? key,
    required this.announce,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AnnounceService announceService = AnnounceService();
    AuthService authService = AuthService();

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
            .deleteAnnounce(announce.id, authService.getCurrentUser()?.id)
            .then((value) => {callback(1), Navigator.of(context).pop()});
      },
    );
    AlertDialog alert = AlertDialog(
      title: const Text("Attention"),
      content: const Text("Voulez vous supprimer cette annonce ?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    DateService dateService = DateService();
    return Card(
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 110,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: announce.image.isEmpty
                        ? Image.asset('lib/assets/images/no_image.jpeg')
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
                    SizedBox(
                      width: (MediaQuery.of(context).size.height / 3.8),
                      child: Text(
                        announce.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                        overflow: TextOverflow.fade,
                        softWrap: true,
                        maxLines: 2,
                      ),
                    ),
                    Text(
                      announce.getPrice(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                        width: (MediaQuery.of(context).size.height / 5.5),
                        child: Text(
                          announce.location,
                          overflow: TextOverflow.fade,
                          softWrap: true,
                          maxLines: 2,
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
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,

                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return alert;
                      },
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 5, bottom: 5, left: 20, right: 20),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.delete_forever,
                          color: Colors.white60,
                          size: 25,
                        ),
                        Text('Supprimer'),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_sharp,
                          color: Colors.white,
                          size: 25,
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
