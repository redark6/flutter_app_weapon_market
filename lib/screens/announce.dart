import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';
import 'package:weapon_marketplace/screens/home.dart';
import 'package:weapon_marketplace/screens/signup.dart';
import '../models/announce.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class AnnounceScreen extends StatefulWidget {
  final Announce announce;
  const AnnounceScreen({
    Key? key, required this.announce,
  }) : super(key: key);

  _callNumber(String number) async{
     //set the number here
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }
  @override
  State<AnnounceScreen> createState() => _AnnounceScreenState();
}

class _AnnounceScreenState extends State<AnnounceScreen> {
  @override
  Widget build(BuildContext context) {
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
                icon: Icon(
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
          padding: EdgeInsets.symmetric(horizontal: 30.0),
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
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  widget.announce.name,
                  style: TextStyle(color: Colors.black, fontSize: 20.0,fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  '${widget.announce.price}€',
                  style: TextStyle(color: Colors.deepOrange, fontSize: 16.0,fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Aujourd\'hui à 18h30',
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
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
                                    builder: (context) => SignupScreen()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15,bottom: 15,left: 10, right: 10),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(140),
                                  child:  widget.announce.image.isEmpty ?
                                    Image.asset('lib/assets/images/no_image.jpeg',
                                      width: 70,
                                      height: 70,
                                      fit: BoxFit.cover) :
                                    Image.memory(base64.decode(widget.announce.image),
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
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  widget.announce.content,
                  style: TextStyle(color: Colors.black, fontSize: 14.0),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Localisation',
                  style: TextStyle(color: Colors.black, fontSize: 20.0,fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
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
                                      style: TextStyle(color: Colors.white, fontSize: 20.0),
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()));
                            },
                            child: Padding(
                                padding: const EdgeInsets.only(top: 15,bottom: 15,left: 10, right: 10),
                                child: Row(
                                  children: [
                                    Icon(Icons.mail_outline),
                                    Text(
                                      'Email',
                                      style: TextStyle(color: Colors.white, fontSize: 20.0),
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