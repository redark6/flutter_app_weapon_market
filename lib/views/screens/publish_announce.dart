import 'package:flutter/material.dart';


class PublishAnnounceScreen extends StatefulWidget {
  PublishAnnounceScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PublishAnnounceScreen> createState() => _PublishAnnounceState();
}

class _PublishAnnounceState extends State<PublishAnnounceScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black87,
              automaticallyImplyLeading: false,
              centerTitle: false,
              elevation: 2,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_sharp,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                  children: [
                    SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 40),
                            child: Text(
                              'Déposer votre annonce',
                              style: TextStyle(color: Colors.black, fontSize: 25.0),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                              'Décrivez le bien que vous souhaitez mettre en vente',
                              style: TextStyle(color: Colors.black, fontSize: 15.0),
                            ),
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 35),
                                    child: TextFormField(
                                      cursorColor: Colors.deepOrange,
                                      decoration: InputDecoration(
                                        hintText: "Titre de l'annonce",
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(width: 1, color: Colors.black87),
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(width: 1, color: Colors.black87),
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(width: 1, color: Colors.redAccent),
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                      ),
                                      // The validator receives the text that the user has entered.
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Veuillez définir un titre';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: TextFormField(
                                      cursorColor: Colors.deepOrange,
                                      decoration: InputDecoration(
                                        hintText: "Category",
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(width: 1, color: Colors.black87),
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(width: 1, color: Colors.black87),
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(width: 1, color: Colors.redAccent),
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                      ),
                                      // The validator receives the text that the user has entered.
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Veuille choisir une category';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: TextFormField(
                                      cursorColor: Colors.deepOrange,
                                      decoration: InputDecoration(
                                        hintText: "Localisation du bien",
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(width: 1, color: Colors.black87),
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(width: 1, color: Colors.black87),
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(width: 1, color: Colors.redAccent),
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                      ),
                                      // The validator receives the text that the user has entered.
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Veuillez saisir un lieu';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: TextFormField(
                                      cursorColor: Colors.deepOrange,
                                      decoration: InputDecoration(
                                        hintText: "Prix",
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(width: 1, color: Colors.black87),
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(width: 1, color: Colors.black87),
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(width: 1, color: Colors.redAccent),
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                      ),
                                      // The validator receives the text that the user has entered.
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Veuillez definir un prix';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: TextFormField(
                                      maxLines: 6,
                                      cursorColor: Colors.deepOrange,
                                      decoration: InputDecoration(
                                        hintText: "Description",
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(width: 1, color: Colors.black87),
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(width: 1, color: Colors.black87),
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(width: 1, color: Colors.redAccent),
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                      ),
                                      // The validator receives the text that the user has entered.
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Veuillez entrer un description';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ]
                            ),
                          ),
                          //const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(top: 30, bottom: 30),
                            child: Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black87,
                                      ),
                                      onPressed: () {

                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 15,bottom: 15,left: 10, right: 10),
                                        child: Row(
                                          children: [
                                            Text('Publier mon annonce'),
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
                        ],
                      ),
                    ),
                  ]
              ),
            )
        )
    );
  }
}