import 'dart:convert';
import 'package:flutter/material.dart';
import '../../models/sign_in.dart';
import '../../models/sign_up.dart';
import '../services/authentication_service.dart';


class AuthenticationController with ChangeNotifier {
  AuthenticationController();
/*
  AuthenticationService authenticationService = AuthenticationService();

  Future<String> signIn(SignIn signIn) async {
    final response = await authenticationService.signIn(signIn);
    Map<String, dynamic> map = jsonDecode(response.body);

    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', map['access_token']);
    String? token = prefs.getString('access_token');

    if (response.statusCode == 200 || response.statusCode == 201) {
      globals.token = map['access_token'];
      print('success signIn ');
      return globals.token.toString();
    } else {
      throw Exception('Failed to sign in');
    }
  }

  Future<String> signUp(SignUp signUp) async {
    final response = await authenticationService.signUp(signUp);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return "Ok";
    } else {
      throw Exception('Failed to sign up');
    }
  }


 */
}