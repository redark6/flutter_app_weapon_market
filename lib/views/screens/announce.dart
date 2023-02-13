import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weapon_marketplace/services/announce_service.dart';
import 'package:weapon_marketplace/services/auth_service.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';
import 'package:weapon_marketplace/services/date_service.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weapon_marketplace/views/screens/user_announce.dart';
import 'package:maps_launcher/maps_launcher.dart';

import '../../models/announce.dart';
import '../../models/user.dart';

class AnnounceScreen extends StatefulWidget {
  final Announce announce;

  const AnnounceScreen({
    Key? key,
    required this.announce,
  }) : super(key: key);

  _callNumber(String number) async {
    //set the number here
    await FlutterPhoneDirectCaller.callNumber(number);
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  @override
  State<AnnounceScreen> createState() => _AnnounceScreenState();
}

class _AnnounceScreenState extends State<AnnounceScreen> {
  DateService dateService = DateService();
  late Future<Announce?> announce;
  AnnounceService announceService = AnnounceService();
  late Future<User?> user;
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    announce = announceService.findAnnounce(widget.announce.id);
    user = authService.getUserById(widget.announce.userId);
    return FutureBuilder(
        future: Future.wait([announce, user]),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          return snapshot.data != null
              ? SafeArea(
                  child: Scaffold(
                    appBar: AppBar(
                      backgroundColor: Colors.black87,
                      automaticallyImplyLeading: false,
                      leading: IconButton(
                        icon: const Icon(
                          Icons.arrow_back_sharp,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: IconButton(
                            icon: Icon(
                              snapshot.data![0].favorite == false
                                  ? Icons.star_border
                                  : Icons.star,
                              color: snapshot.data![0].favorite == false
                                  ? Colors.white
                                  : Colors.deepOrange,
                              size: 30,
                            ),
                            onPressed: () {
                              if (snapshot.data![0].favorite == false) {
                                announceService
                                    .addFavorite(snapshot.data![0].id,
                                        authService.getCurrentUser()!.id)
                                    .then((value) => setState(() {}));
                              } else {
                                announceService
                                    .deleteFavorite(snapshot.data![0].id,
                                        authService.getCurrentUser()!.id)
                                    .then((value) => setState(() {}));
                              }
                            },
                          ),
                        ),
                      ],
                      centerTitle: false,
                      elevation: 2,
                    ),
                    body: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 300,
                            width: double.infinity,
                            child: FittedBox(
                              fit: BoxFit.fitHeight,
                              child: FullScreenWidget(
                                child: snapshot.data![0].image.isEmpty
                                    ? Image.asset(
                                        'lib/assets/images/no_image.jpeg')
                                    : Image.memory(
                                        base64.decode(snapshot.data![0].image)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Text(
                              snapshot.data![0].name,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Text(
                              '${snapshot.data![0].price}€',
                              style: const TextStyle(
                                  color: Colors.deepOrange,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Text(
                              dateService.formatDate(snapshot.data![0].date),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 16.0),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    UserAnnounceScreen(
                                                        userId: snapshot
                                                            .data![0].userId)));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 15,
                                            bottom: 15,
                                            left: 10,
                                            right: 10),
                                        child: Row(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(140),
                                              child: snapshot.data![1] ==
                                                          null ||
                                                      snapshot
                                                          .data![1]
                                                          .profilePictureUrl
                                                          .isEmpty
                                                  ? Image.asset(
                                                      'lib/assets/images/no_image.jpeg',
                                                      width: 70,
                                                      height: 70,
                                                      fit: BoxFit.cover)
                                                  : Image.memory(
                                                      base64.decode(snapshot
                                                          .data![1]
                                                          .profilePictureUrl),
                                                      width: 70,
                                                      height: 70,
                                                      fit: BoxFit.cover,
                                                    ),
                                            ),
                                            const SizedBox(width: 10),
                                            Text(
                                              snapshot.data![0].username,
                                              style:
                                                  const TextStyle(fontSize: 20),
                                            ),
                                            const Spacer(),
                                            const Icon(
                                              Icons.arrow_forward_sharp,
                                              color: Colors.deepOrange,
                                              size: 25,
                                            ),
                                          ],
                                        ),
                                      )),
                                )
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                              'Description',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Text(
                              snapshot.data![0].content,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 14.0),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                              'Localisation',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.map,
                                    color: Colors.deepOrange,
                                    size: 25,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: GestureDetector(
                                      onTap: () => {MapsLauncher.launchQuery(snapshot.data![0].location)},
                                      child: Text(
                                        snapshot.data![0].location,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14.0),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          //const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(top: 30, bottom: 40),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.black87,
                                        ),
                                        onPressed: () async {
                                          widget._callNumber(
                                              snapshot.data![0].phone);
                                        },
                                        child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 15,
                                                bottom: 15,
                                                left: 10,
                                                right: 10),
                                            child: Row(
                                              children: const [
                                                Icon(Icons
                                                    .phone_enabled_outlined),
                                                Text(
                                                  'Télephone',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15.0),
                                                ),
                                              ],
                                            ))),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.black87,
                                        ),
                                        onPressed: () {
                                          final Uri emailLaunchUri = Uri(
                                            scheme: 'mailto',
                                            path: snapshot.data![0].email,
                                            query: widget
                                                .encodeQueryParameters(<String,
                                                    String>{
                                              'subject':
                                                  'A propos de votre annonce',
                                              'body':
                                                  "Bonjour, votre annonce : \"${snapshot.data![0].name}\" est elle toujours disponible ?"
                                            }),
                                          );

                                          launchUrl(emailLaunchUri);
                                        },
                                        child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 15,
                                                bottom: 15,
                                                left: 10,
                                                right: 10),
                                            child: Row(
                                              children: const [
                                                Icon(Icons.mail_outline),
                                                Text(
                                                  'Email',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15.0),
                                                ),
                                              ],
                                            ))),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : Container(
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(
                    color: Colors.deepOrange,
                  ));
        });
  }
}
