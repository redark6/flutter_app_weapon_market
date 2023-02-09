import 'dart:io';

class SignUp {

  final String email;
  final String username;
  final String password;
  final File picture;

  const SignUp({
    required this.email,
    required this.username,
    required this.password,
    required this.picture,
  });

}