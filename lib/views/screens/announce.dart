import 'package:flutter/material.dart';
import 'package:weapon_marketplace/views/screens/signup.dart';

import 'home.dart';


class AnnounceScreen extends StatefulWidget {
  AnnounceScreen({
    Key? key,
  }) : super(key: key);

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
            icon: Icon(
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
                  child: Image.asset('lib/assets/images/no_image.jpeg'),
                  fit: BoxFit.fitHeight,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  'Nom de l\'annonce',
                  style: TextStyle(color: Colors.black, fontSize: 20.0,fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  '6500€',
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
                              children: const [
                                Image(
                                  image: AssetImage('lib/assets/images/no_image.jpeg'),
                                  height: 50,
                                  width: 50,
                                ),
                                Text('nom vendeur'),
                                Spacer(),
                                Icon(
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
              const Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent commodo ultricies sollicitudin. Nunc pulvinar nibh metus, eu auctor ipsum dignissim non. Curabitur non diam eu urna eleifend lobortis. Phasellus sed finibus arcu. Suspendisse eleifend ante ac facilisis commodo. Quisque ut eros vel nulla viverra dignissim a ut lacus. Proin ac turpis dolor. Aliquam ornare vulputate cursus. Vestibulum a hendrerit nibh. Integer quis finibus quam. Nullam a auctor libero. ',
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
                    children: const [
                      Icon(
                        Icons.map,
                        color: Colors.deepOrange,
                        size: 25,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          '25 rue des tartines nutella',
                          style: TextStyle(color: Colors.black, fontSize: 14.0),
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