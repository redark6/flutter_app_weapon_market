import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weapon_marketplace/services/date_service.dart';
import 'package:weapon_marketplace/views/screens/announce.dart';

import '../../models/announce.dart';

class UserAnnounceItem extends StatelessWidget {
  final Announce announce;

  const UserAnnounceItem({
    Key? key,
    required this.announce,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateService dateService = DateService();
    return SizedBox(
      height: double.infinity,
      child: GestureDetector(
        onTap: () =>  Navigator.push(context,MaterialPageRoute(builder: (context) => AnnounceScreen(announce: announce))),
        child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(3.0),
                        child: announce.image.isEmpty
                            ? Image.network(
                                announce.image,
                                fit: BoxFit.fill,
                              )
                            : Image.memory(base64.decode(announce.image)),
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 160.0,
                          child: Text(
                            announce.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                            overflow: TextOverflow.fade,
                            softWrap: true,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      announce.getPrice(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    Text(
                      announce.location,
                      style: const TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 14),
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
      ),
    );
  }
}
