import 'package:flutter/material.dart';


class ProfilScreen extends StatefulWidget {
  ProfilScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {

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
          centerTitle: false,
          elevation: 2,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text("Mon compte",
                  style: TextStyle(color: Colors.black, fontSize: 20.0,fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20,bottom: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15,bottom: 15,left: 10, right: 10),
                        child: Row(
                          children: const [
                            CircleAvatar(
                              radius: 48, // Image radius
                              backgroundImage: AssetImage('lib/assets/images/no_image.jpeg'),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text('nom vendeur',
                                  style: TextStyle(color: Colors.black, fontSize: 25.0,fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 15),
                child: Divider(
                  color: Colors.black,
                  height: 2,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15,bottom: 15,left: 10, right: 10),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.person,
                              color: Colors.deepOrange,
                              size: 25,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text('nom utilisateur',
                                style: TextStyle(color: Colors.black, fontSize: 15.0,fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15,bottom: 15,left: 10, right: 10),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.phone_enabled,
                              color: Colors.deepOrange,
                              size: 25,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text('0645821584',
                                style: TextStyle(color: Colors.black, fontSize: 15.0,fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15,bottom: 15,left: 10, right: 10),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.mail,
                              color: Colors.deepOrange,
                              size: 25,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text('truc@truc.fr',
                                style: TextStyle(color: Colors.black, fontSize: 15.0,fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
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