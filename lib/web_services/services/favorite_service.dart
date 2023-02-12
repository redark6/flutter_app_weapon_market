import 'package:http/http.dart' as http;

import '../../models/sign_in.dart';

class UserService {
  UserService();

  String url = "http://localhost:8080/";

  Future<http.Response> addAnnounceInFavorite(SignIn signIn) async {
    final response = await http.post(Uri.parse("${url}auth/login"), body: signIn);
    return response;
  }

  Future<http.Response> removeAnnounceInFavorite(SignIn signIn) async {
    final response = await http.post(Uri.parse("${url}auth/login"), body: signIn);
    return response;
  }

  Future<http.Response> getFavoriteAnnounces(SignIn signIn) async {
    final response = await http.post(Uri.parse("${url}auth/login"), body: signIn);
    return response;
  }

}