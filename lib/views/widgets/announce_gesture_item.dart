import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weapon_marketplace/services/date_service.dart';

import '../../models/announce.dart';


class AnnounceGestureItem extends StatelessWidget {
  final Announce announce;

  const AnnounceGestureItem({
    Key? key,
    required this.announce,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    child: announce.image.isEmpty ?
                            Image.asset('lib/assets/images/no_image.jpeg'):
                            Image.memory(base64.decode(announce.image),
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
                      width: 240.0,
                      child: Text(
                        announce.name,
                        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                        overflow: TextOverflow.fade,
                        softWrap: true,
                        maxLines: 2,
                      ),
                    ),
                    Text(
                      announce.getPrice(),
                      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        announce.location,
                        style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
                      ),
                    ),
                    Text(
                      dateService.formatDate(announce.date),
                      style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5,bottom: 5),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () {
                    () => {
                      print("supprimer")
                    };
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5,bottom: 5,left: 20, right: 20),
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
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}