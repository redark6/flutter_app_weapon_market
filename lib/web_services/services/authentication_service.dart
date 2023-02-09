import 'package:http/http.dart' as http;

import '../../models/sign_in.dart';
import '../../models/sign_up.dart';

class AuthenticationService {
  AuthenticationService();

  String url = "http://localhost:8080/";

  Future<http.Response> signIn(SignIn signIn) async {
    final response = await http.post(Uri.parse("${url}auth/login"), body: signIn);
    return response;
  }

  Future<http.Response> signUp(SignUp signUp) async {
    final response = await http.post(Uri.parse("${url}user/create"), body: signUp);
    return response;
  }

}