import 'dart:io';

class UpdateAnnounce {

  final String email;
  final String username;
  final String password;
  final File picture;

  const UpdateAnnounce({
    required this.email,
    required this.username,
    required this.password,
    required this.picture,
  });

}