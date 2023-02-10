import 'package:flutter/material.dart';
import 'package:weapon_marketplace/models/sign_up.dart';
import 'package:weapon_marketplace/screens/announce.dart';
import 'package:weapon_marketplace/screens/home.dart';
import '../models/user.dart';
import '../services/auth_service.dart';
import '../web_services/controllers/authentication_controller.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  AuthenticationController authenticationController =
  AuthenticationController();

  TextEditingController usernameEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();

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
          body: Column(
              children: [
                SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: Center(
                            child: Text(
                              'Inscription',
                              style: TextStyle(color: Colors.black, fontSize: 30.0,fontWeight: FontWeight.bold),
                            ),
                          )
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 35),
                                child: TextFormField(
                                  controller: usernameEditingController,
                                  cursorColor: Colors.deepOrange,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.person),
                                    hintText: "Nom d'utilisateur",
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
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 35),
                                child: TextFormField(
                                  controller: emailEditingController,
                                  cursorColor: Colors.deepOrange,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.mail),
                                    hintText: "Email",
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
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 35),
                                child: TextFormField(
                                  controller: passwordEditingController,
                                  cursorColor: Colors.deepOrange,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.lock),
                                    hintText: "Mot de passe",
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
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ]
                        ),
                      ),
                      //const Spacer(),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black87,
                                ),
                                onPressed: () {
                                  authService.register(SignUp(email: emailEditingController.text,
                                  password: passwordEditingController.text, username: usernameEditingController.text)).then((value) =>
                                  {
                                    if(authService.isLoggedIn()) {
                                      Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AnnounceScreen()))
                                    }
                                  });

                                },
                                child: Padding(
                                    padding: const EdgeInsets.only(top: 15,bottom: 15,left: 10, right: 10),
                                    child: Text(
                                      'Créer mon compte',
                                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                                    )
                                )
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ]
          ),
        )
    );
  }
}