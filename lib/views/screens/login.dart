import 'package:flutter/material.dart';
import 'package:weapon_marketplace/views/screens/main.dart';
import 'package:weapon_marketplace/views/screens/signup.dart';

import '../../services/announce_service.dart';

import 'package:weapon_marketplace/models/sign_in.dart';
import 'package:weapon_marketplace/services/auth_service.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();

  bool failedAttempt = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isSecret = true;
  final AuthService authService = AuthService();
  final AnnounceService announceService = AnnounceService();

  failedAttemptChange() {
    setState(() {
      failedAttempt = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset : false,

          appBar: AppBar(
            backgroundColor: Colors.black87,
            automaticallyImplyLeading: false,
            centerTitle: false,
            elevation: 2,
          ),
          body: Column(
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
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
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.person),
                                    hintText: "Nom d'utilisateur",
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(width: 1, color: Colors.black87),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(width: 1, color: Colors.black87),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(width: 1, color: Colors.redAccent),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                  // The validator receives the text that the user has entered.
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Le champ ne doit pas être vide';
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
                                  textInputAction: TextInputAction.done,
                                  decoration: InputDecoration(
                                    prefixIcon:const  Icon(Icons.lock),
                                    hintText: "Mot de passe",
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(width: 1, color: Colors.black87),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(width: 1, color: Colors.black87),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(width: 1, color: Colors.redAccent),
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
                                      return 'Le champ ne doit pas être vide';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ]
                        ),
                      ),
                      if(failedAttempt)const Padding(
                        padding: EdgeInsets.only(top: 15,bottom: 15,left: 10, right: 10),
                        child: Text("Erreur lors de la connexion",
                          style: TextStyle(color: Colors.red))
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black87,
                                  ),
                                  onPressed: () {
                                    authService.logIn(SignIn(username: usernameEditingController.text, password: passwordEditingController.text)).whenComplete(() =>
                                    {
                                      if(_formKey.currentState!.validate() == true && authService.isLoggedIn() == true) {
                                            Navigator.push(context,MaterialPageRoute(builder: (context) => const MainScreen()))
                                      } else {
                                        failedAttemptChange()
                                      }
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 15,bottom: 15,left: 10, right: 10),
                                    child: Row(
                                      children: const [
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
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Row(
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
                                            builder: (context) => const SignupScreen()));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 15,bottom: 15,left: 10, right: 10),
                                    child: Row(
                                      children: const [
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