import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:weapon_marketplace/models/create_announce%20.dart';
import 'package:weapon_marketplace/services/announce_service.dart';
import 'package:weapon_marketplace/services/auth_service.dart';

import '../../models/user.dart';
import 'announce.dart';

class PublishAnnounceScreen extends StatefulWidget {
  const PublishAnnounceScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PublishAnnounceScreen> createState() => _PublishAnnounceState();
}

class _PublishAnnounceState extends State<PublishAnnounceScreen> {
  File? imageFile;
  String? title, location, price, description;

  _getFromGallery(String titleTmp, String descriptionTmp, String locationTmp,
      String priceTmp) async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        title = titleTmp;
        description = descriptionTmp;
        location = locationTmp;
        price = priceTmp;
      });
    }
  }

  /// Get from Camera
  ///
  _getFromCamera(String titleTmp, String descriptionTmp, String locationTmp,
      String priceTmp) async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        title = titleTmp;
        description = descriptionTmp;
        location = locationTmp;
        price = priceTmp;
      });
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AnnounceService announceService = AnnounceService();
    AuthService authService = AuthService();

    final TextEditingController titleController = TextEditingController();
    titleController.text = title ?? '';
    final TextEditingController descriptionController = TextEditingController();
    descriptionController.text = description ?? '';
    final TextEditingController locationController = TextEditingController();
    locationController.text = location ?? '';
    final TextEditingController priceController = TextEditingController();
    priceController.text = price ?? '';

    postAnnounce() {
      User? user = authService.getCurrentUser();
      if (user != null) {
        announceService
            .postAnnounce(
                CreateAnnounce(
                    name: titleController.text,
                    content: descriptionController.text,
                    location: locationController.text,
                    category: 1,
                    price: priceController.text),
                user.id,
                imageFile!)
            .then((value) => {
                  if (value != null)
                    {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AnnounceScreen(announce: value)))
                    }
                });
      }
    }

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black87,
              automaticallyImplyLeading: false,
              centerTitle: false,
              elevation: 2,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_sharp,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: SingleChildScrollView(
              child: Column(children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 40),
                        child: Text(
                          'D??poser votre annonce',
                          style: TextStyle(color: Colors.black, fontSize: 25.0),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Text(
                          'D??crivez le bien que vous souhaitez mettre en vente',
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
                                  controller: titleController,
                                  cursorColor: Colors.deepOrange,
                                  decoration: InputDecoration(
                                    hintText: "Titre de l'annonce",
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 1, color: Colors.black87),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 1, color: Colors.black87),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 1, color: Colors.redAccent),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                  // The validator receives the text that the user has entered.
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Veuillez d??finir un titre';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: TextFormField(
                                  controller: locationController,
                                  cursorColor: Colors.deepOrange,
                                  decoration: InputDecoration(
                                    hintText: "Localisation du bien",
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 1, color: Colors.black87),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 1, color: Colors.black87),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 1, color: Colors.redAccent),
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
                                  controller: priceController,
                                  cursorColor: Colors.deepOrange,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    // for below version 2 use this
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9]'))
                                  ],
                                  decoration: InputDecoration(
                                    hintText: "Prix",
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 1, color: Colors.black87),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 1, color: Colors.black87),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 1, color: Colors.redAccent),
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
                                  controller: descriptionController,
                                  maxLines: 6,
                                  cursorColor: Colors.deepOrange,
                                  decoration: InputDecoration(
                                    hintText: "Description",
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 1, color: Colors.black87),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 1, color: Colors.black87),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 1, color: Colors.redAccent),
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
                            ]),
                      ),
                      //const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Column(
                          children: [
                            imageFile != null
                                ? Image.file(
                                    imageFile!,
                                    width: double.infinity,
                                    height: 160,
                                    fit: BoxFit.cover,
                                  )
                                : const Text(
                                    "Vous devez choirir une image",
                                    style: TextStyle(color: Colors.red),
                                  ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30, bottom: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black87,
                                  ),
                                  onPressed: () {
                                    _getFromCamera(
                                        titleController.text,
                                        descriptionController.text,
                                        locationController.text,
                                        priceController.text);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15,
                                        bottom: 15,
                                        left: 10,
                                        right: 10),
                                    child: Row(
                                      children: const [
                                        Text('Prendre une photo'),
                                        Spacer(),
                                        Icon(
                                          Icons.camera_alt_rounded,
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
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black87,
                                  ),
                                  onPressed: () {
                                    _getFromGallery(
                                        titleController.text,
                                        descriptionController.text,
                                        locationController.text,
                                        priceController.text);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15,
                                        bottom: 15,
                                        left: 10,
                                        right: 10),
                                    child: Row(
                                      children: const [
                                        Text('Ouvrir la gallerie'),
                                        Spacer(),
                                        Icon(
                                          Icons.photo_library_rounded,
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
                                    // Validate returns true if the form is valid, or false otherwise.
                                    if (_formKey.currentState!.validate() ||
                                        imageFile == null) {
                                      postAnnounce();
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15,
                                        bottom: 15,
                                        left: 10,
                                        right: 10),
                                    child: Row(
                                      children: const [
                                        Text('Publier mon annonce'),
                                        Spacer(),
                                        Icon(
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
                    ],
                  ),
                ),
              ]),
            )));
  }
}
