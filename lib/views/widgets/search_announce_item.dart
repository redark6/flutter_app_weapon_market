import 'package:flutter/material.dart';

import '../../models/announce.dart';


class SearchAnnounceItem extends StatelessWidget {
  final Announce annnounce;

  const SearchAnnounceItem({
    Key? key,
    required this.annnounce,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Building user ${annnounce.name}');
    return SizedBox(
      height: double.infinity,
      child: Card(
        child: ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top:5),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child:
                        ClipRRect(
                          borderRadius: BorderRadius.circular(3.0),
                          child: Image.network(
                            annnounce.image,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child:
                      IconButton(
                          color: Colors.black,
                          icon: Icon(Icons.star_border_outlined),
                          onPressed: () => {
                            print("rien pr le moment")
                          }
                      ),
                    ),
                  ],
                )
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        annnounce.name,
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ],
                  ),
                  Text(
                    annnounce.price,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  Text(
                    annnounce.location,
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
                  ),
                  Text(
                    annnounce.date,
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
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