import 'package:http/http.dart' as http;
import 'package:weapon_marketplace/models/change_password.dart';

import '../../models/sign_in.dart';
import '../../models/sign_up.dart';

class UserService {
  UserService();

  String url = "http://localhost:8080/";

  Future<http.Response> getProfile(SignIn signIn) async {
    final response = await http.post(Uri.parse("${url}auth/login"), body: signIn);
    return response;
  }

  Future<http.Response> updateProfile(SignIn signIn) async {
    final response = await http.post(Uri.parse("${url}auth/login"), body: signIn);
    return response;
  }

  Future<http.Response> changePassword(ChangePassword changePassword) async {
    final response = await http.post(Uri.parse("${url}user/create"), body: changePassword);
    return response;
  }

  Future<http.Response> changePicture(SignUp signUp) async {
    final response = await http.post(Uri.parse("${url}user/create"), body: signUp);
    return response;
  }

  Future<http.Response> deleteAccount(SignUp signUp) async {
    final response = await http.post(Uri.parse("${url}user/create"), body: signUp);
    return response;
  }
}