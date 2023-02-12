import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weapon_marketplace/services/date_service.dart';

import '../../models/announce.dart';
import '../screens/announce.dart';

class SearchAnnounceItem extends StatelessWidget {
  final Announce announce;

  const SearchAnnounceItem({
    Key? key,
    required this.announce,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateService dateService = DateService();
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AnnounceScreen(announce: announce))),
      child: SizedBox(
        height: double.infinity,
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(3.0),
                              child: announce.image.isEmpty
                                  ? Image.asset(
                                      'lib/assets/images/no_image.jpeg',
                                      fit: BoxFit.fill,
                                    )
                                  : Image.memory(
                                      base64.decode(announce.image),
                                      fit: BoxFit.fill,
                                      height: 130,
                                    ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          child: IconButton(
                              color: Colors.black,
                              icon: const Icon(Icons.star_border_outlined),
                              onPressed: () => {print("rien pr le moment")}),
                        ),
                      ],
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: (MediaQuery.of(context).size.height / 5.5),
                          child: Text(
                            announce.name,
                            overflow: TextOverflow.fade,
                            softWrap: true,
                            maxLines: 2,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
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
