import 'package:flutter/material.dart';
import 'package:weapon_marketplace/models/sign_in.dart';
import 'package:weapon_marketplace/screens/announce.dart';
import 'package:weapon_marketplace/screens/home.dart';
import 'package:weapon_marketplace/screens/signup.dart';
import 'package:weapon_marketplace/services/auth_service.dart';
import '../services/announce_service.dart';
import '../web_services/controllers/authentication_controller.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthenticationController authenticationController =
  AuthenticationController();

  TextEditingController usernameEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isSecret = true;
  final AuthService authService = AuthService();
  final AnnounceService announceService = AnnounceService();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black87,
            automaticallyImplyLeading: false,
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
                        child: Text(
                          'Bonjour',
                          style: TextStyle(color: Colors.black, fontSize: 25.0),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Text(
                          'Connectez-vous pour découvrire toutes nos fonctionnalités',
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
                                  controller: passwordEditingController,
                                  obscureText: _isSecret,
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
                                    suffixIcon: InkWell(
                                      onTap: () => setState(() => _isSecret = !_isSecret),
                                      child: Icon(!_isSecret
                                          ? Icons.visibility
                                          : Icons.visibility_off),
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
                      Padding(
                        padding: const EdgeInsets.only(top: 18),
                        child: Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen()));
                              },
                              child: Text(
                                'mot de passe oublié',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                    decoration: TextDecoration.underline,
                                  fontSize: 15
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black87,
                                ),
                                onPressed: () {
                                  authService.logIn(SignIn(username: usernameEditingController.text, password: passwordEditingController.text)).whenComplete(() =>
                                  {
                                    if(authService.isLoggedIn()) {
                                      announceService.getAnnounce(7).then((value) => {
                                        if(value != null){
                                          Navigator.push(context,MaterialPageRoute(builder: (context) => AnnounceScreen(announce: value,)))
                                        }})
                                    }
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 15,bottom: 15,left: 10, right: 10),
                                  child: Row(
                                    children: [
                                      Text('Se connecter'),
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

                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black87,
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
                                      Text('Créer un compte'),
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
                    ],
                  ),
                ),
              ]
          ),
        )
    );
  }
}