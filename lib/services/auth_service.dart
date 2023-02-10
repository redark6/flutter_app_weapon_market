import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:weapon_marketplace/models/sign_up.dart';
import 'package:weapon_marketplace/services/secure_storage.dart';

import '../models/sign_in.dart';
import '../models/user.dart';


class AuthService {
  static String apiUrl = "https://192.168.3.2:8443/";
  static User? currentUser;
  static String? photo;

  AuthService();

  Future<User?> getLoggedUser(String username) async {
    List<User> users = [];
    final response = await http.get(Uri.parse(apiUrl + "users/users"));

    for (dynamic element in jsonDecode(response.body)) {
      User user = User.fromJson(element);
      users.add(user);
    }

    User loggedUser = users.firstWhere((user) => user.username == username);
    setCurrentUser(loggedUser);
    return loggedUser;
  }



  Future<User> getUserById(int id) async {
    User user;
    final response =
    await http.get(Uri.parse(apiUrl + "users/" + id.toString()));
    user = User.fromJson(jsonDecode(response.body));

    return user;
  }

  Future<http.Response> logIn(SignIn user) async {
    var response = await http.post(
      Uri.parse("${apiUrl}login"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': user.username,
        'password': user.password
      }),
    );

    if(response.statusCode == 200) {
      String source = response.headers['set-cookie'].toString();
      int start = source.indexOf("JSESSIONID=") + "JSESSIONID=".length;
      int end = source.indexOf(";", start);
      String extracted = source.substring(start, end);
      SecureStorageService.getInstance().set("token", extracted);
    }



    await getLoggedUser(user.username);
    return response;
  }

  Future<http.Response> register(SignUp user) async {
    final response = await http.post(
      Uri.parse(apiUrl + 'users/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': user.username,
        'password': user.password,
        'email': user.email,
      }),
    );
    if(response.statusCode == 200){
      await logIn(SignIn(username: user.username, password: user.password));
    }
    return response;
  }

  Future<http.Response> updateAccount( User user) async {


    String token = "";
    token = await SecureStorageService.getInstance()
        .get("token")
        .then((value) => token = value.toString());
    final response = await http.put(
      Uri.parse(apiUrl + "users/" + user.id.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'cookie': token,
      },
      body: jsonEncode(<String, String>{
        'id': user.id.toString(),
        'username': user.username,
        'password': user.password,
        'email': user.email,
      }),
    );

    return response;
  }

  Future<http.StreamedResponse> uploadPp(File file) async {
    String token = "";
    token = await SecureStorageService.getInstance()
        .get("token")
        .then((value) => token = value.toString());

    var request = http.MultipartRequest(
      'POST',
      Uri.parse(
        apiUrl + 'users/profile-picture',
      ),
    );


    request.files.add(http.MultipartFile('image',
        File(file.path).readAsBytes().asStream(), File(file.path).lengthSync(),
        filename: file.path.split("/").last));
    request.headers['cookie'] = token;
    var res = await request.send().then((response) {
      if(response.statusCode == 200) {
        /*  AuthService.currentUser!.user.profilePictureUrl = dotenv.env["BUCKET_NAME"].toString();
        AuthService.currentUser!.user.profilePictureName = file.path.split("/").last; */
      }
    });
    return res;
  }

  static void setCurrentUser(User? user) {
    currentUser = user;
  }

  bool isLoggedIn() {
    print(currentUser);
    return currentUser != null;
  }
}