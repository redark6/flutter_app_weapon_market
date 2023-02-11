import 'package:flutter/material.dart';

import '../../models/announce.dart';


class AnnounceGestureItem extends StatelessWidget {
  final Announce annnounce;

  const AnnounceGestureItem({
    Key? key,
    required this.annnounce,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Building user ${annnounce.name}');
    return Container(
      child: Card(
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
                      Text(
                        annnounce.name,
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                      Text(
                        annnounce.getPrice(),
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
                        children: [
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
      ),
    );
  }
}