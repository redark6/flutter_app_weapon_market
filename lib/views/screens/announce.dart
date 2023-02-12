import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weapon_marketplace/services/auth_service.dart';
import 'package:weapon_marketplace/views/screens/signup.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';
import 'package:weapon_marketplace/services/date_service.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/announce.dart';
import '../../models/user.dart';

class AnnounceScreen extends StatefulWidget {
  final Announce announce;
  const AnnounceScreen({
    Key? key, required this.announce,
  }) : super(key: key);

  _callNumber(String number) async{
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
  AuthService authService = AuthService();
  User? user;
  getUser(userId) async{
    if(user != null) {
      return;
    }
    var us = await authService.getUserById(userId);
    setState(() {
      user = us;
    });
  }
  DateService dateService = DateService();
  @override
  Widget build(BuildContext context) {
    getUser(widget.announce.userId);
    return SafeArea(
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
                icon: const Icon(
                  Icons.star_border,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.pop(context);
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
                  child:
                      FullScreenWidget(
                        child: widget.announce.image.isEmpty ?
                        Image.asset('lib/assets/images/no_image.jpeg'):  Image.memory(base64.decode(widget.announce.image)),

                      ),

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  widget.announce.name,
                  style: const TextStyle(color: Colors.black, fontSize: 20.0,fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  '${widget.announce.price}€',
                  style: const TextStyle(color: Colors.deepOrange, fontSize: 16.0,fontWeight: FontWeight.bold),
                ),
              ),
               Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  dateService.formatDate(widget.announce.date),
                  style: const TextStyle(color: Colors.black, fontSize: 16.0),
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
                                    builder: (context) => const SignupScreen()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15,bottom: 15,left: 10, right: 10),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(140),
                                  child:  user == null ||user!.profilePictureUrl.isEmpty ?
                                    Image.asset('lib/assets/images/no_image.jpeg',
                                      width: 70,
                                      height: 70,
                                      fit: BoxFit.cover) :
                                    Image.memory(base64.decode(user!.profilePictureUrl),
                                      width: 70,
                                      height: 70,
                                      fit: BoxFit.cover,
                                    ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  widget.announce.username,
                                  style: const TextStyle(fontSize: 20),
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.arrow_forward_sharp,
                                  color: Colors.deepOrange,
                                  size: 25,
                                ),
                              ],
                            ),
                          )
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Description',
                  style: TextStyle(color: Colors.black, fontSize: 20.0,fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  widget.announce.content,
                  style: const TextStyle(color: Colors.black, fontSize: 14.0),
                ),
              ),
              const Padding(
                padding:  EdgeInsets.only(top: 15),
                child: Text(
                  'Localisation',
                  style: TextStyle(color: Colors.black, fontSize: 20.0,fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child:
                  Row(
                    children:  [
                      const Icon(
                        Icons.map,
                        color: Colors.deepOrange,
                        size: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          widget.announce.location,
                          style: const TextStyle(color: Colors.black, fontSize: 14.0),
                        ),
                      ),
                    ],
                  )
              ),
              //const Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 30,bottom: 40),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black87,
                            ),
                            onPressed: () async{
                              widget._callNumber(widget.announce.phone);
                            },
                            child: Padding(
                                padding: const EdgeInsets.only(top: 15,bottom: 15,left: 10, right: 10),
                                child: Row(
                                  children: const [
                                    Icon(Icons.phone_enabled_outlined),
                                    Text(
                                      'Télephone',
                                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                                    ),
                                  ],
                                )
                            )
                        ),
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
                                  path: widget.announce.email,
                                  query: widget.encodeQueryParameters(
                                      <String, String>{'subject': 'A propos de votre annonce',
                                        'body': "Bonjour, votre annonce : \"${widget.announce.name}\" est elle toujours disponible ?"}),
                                );

                                 launchUrl(emailLaunchUri);
                            },
                            child: Padding(
                                padding: const EdgeInsets.only(top: 15,bottom: 15,left: 10, right: 10),
                                child: Row(
                                  children: const [
                                    Icon(Icons.mail_outline),
                                    Text(
                                      'Email',
                                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                                    ),
                                  ],
                                )
                            )
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}