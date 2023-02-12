import 'package:http/http.dart' as http;
import 'package:weapon_marketplace/models/create_announce%20.dart';
import 'package:weapon_marketplace/models/update_announce.dart';

class AnnounceService {

  String url = "http://localhost:8080/";

/*
  static Future<List<User>> retrieveUsers() async {
    await Future.delayed(const Duration(seconds: 1));
    final response = await http.get(Uri.parse('https://reqres.in/api/users?page=1&per_page=12'));
    if (response.statusCode != 200) {
      switch (response.statusCode) {
        case 400:
          throw Exception('Bad request');
        case 401:
          throw Exception('Unauthorized');
      }
    }

    final jsonBody = json.decode(response.body);

    final List<User> users = [];

    for (final userJson in jsonBody['data']) {
      users.add(User.fromJson(userJson));
    }

    return users;
  }
*/
  Future<http.Response> getAnnounceById(int id) async {
    final response = await http.get(Uri.parse("${url}auth/login/$id"));
    return response;
  }

  Future<http.Response> createAnnounce(CreateAnnounce announce) async {
    final response = await http.post(Uri.parse("${url}user/create"), body: announce);
    return response;
  }

  Future<http.Response> searchAnnounces(String category, int prixMax, int prixMin, String region, String departement, int userId) async {
    final response = await http.get(Uri.parse("${url}user/create"));
    return response;
  }

  Future<http.Response> updateAnnounce(UpdateAnnounce announce) async {
    final response = await http.put(Uri.parse("${url}user/create"), body: announce);
    return response;
  }

}