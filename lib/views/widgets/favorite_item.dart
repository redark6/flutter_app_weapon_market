import 'package:flutter/material.dart';

import '../../models/announce.dart';


class FavoriteItem extends StatelessWidget {
  final Announce annnounce;

  const FavoriteItem({
    Key? key,
    required this.annnounce,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Building user ${annnounce.name}');
    return Container(
      child: Card(
        child: ListTile(

          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 110,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Image.network(
                    annnounce.image,
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
                      Text(
                        annnounce.name,
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                      IconButton(
                          color: Colors.deepOrange,
                          icon: Icon(Icons.star),
                          onPressed: () => {
                            print("rien pr le moment")
                          }
                      )
                    ],
                  ),
                  Text(
                    annnounce.price,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      annnounce.location,
                      style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
                    ),
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