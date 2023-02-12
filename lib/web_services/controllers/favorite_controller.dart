
import 'package:flutter/cupertino.dart';

import '../../models/announce.dart';

class FavoriteController with ChangeNotifier {
  FavoriteController();


  Future<List<Announce>> getFavoriteAnnounces() async {

    List<Announce> announces = List.generate(2, (index) {
      return Announce(
        id: index,
        name: 'annonce lambda',
        content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent commodo ultricies sollicitudin. Nunc pulvinar nibh metus, eu auctor ipsum dignissim non. Curabitur non diam eu urna eleifend lobortis. Phasellus sed finibus arcu. Suspendisse eleifend ante ac facilisis commodo. Quisque ut eros vel nulla viverra dignissim a ut lacus. Proin ac turpis dolor. Aliquam ornare vulputate cursus. Vestibulum a hendrerit nibh. Integer quis finibus quam. Nullam a auctor libero. ',
        date: '10/02/2023',
        location: 'Quelque part',
        category: 1,
        image: 'https://upload.wikimedia.org/wikipedia/commons/9/9a/Gull_portrait_ca_usa.jpg',
        price: 20,
        userId: 1,
        email: "truc@truc.fr",
        username: "machin",
        phone: "0654852136"
      );
    });

    return announces;

  }
}