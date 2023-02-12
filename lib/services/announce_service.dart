import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:weapon_marketplace/models/announce.dart';
import 'package:weapon_marketplace/models/create_announce%20.dart';
import 'package:weapon_marketplace/services/secure_storage.dart';


import '../models/search.dart';


class AnnounceService {
  static String apiUrl = "https://192.168.3.2:8443/";

  AnnounceService();

  Future<Announce?> getAnnounce(int announceId) async {
    String token = "";
    token = await SecureStorageService.getInstance()
        .get("token")
        .then((value) => token = value.toString());
    final response = await http.get(
      Uri.parse("${apiUrl}announce/$announceId"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'cookie': token,
      },
    );
    if (response.statusCode == 200) {
      return Announce.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  Future<List<Announce>> getAnnounces(Search search) async {
    List<Announce> announces = [];
    String token = "";
    token = await SecureStorageService.getInstance()
        .get("token")
        .then((value) => token = value.toString());
    final response = await http.post(
        Uri.parse("${apiUrl}announce/search"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'cookie': token,
        },
        body: jsonEncode({
          'title': search.title ?? '',
          'regionId': search.regionId,
          'maxPrice': search.maxPrice ?? 0,
          'minPrice': search.minPrice ?? 0,
          'userId': search.userId ?? 0,
        })
    );
    if (response.statusCode == 200) {
      List tmpList = json.decode(response.body) as List;
      for (var element in tmpList) {
        announces.add(Announce.fromJson(element));
      }
      return announces;
    }
    return announces;
  }

  Future<bool> deleteAnnounce(int id, int? user) async {
    String token = "";
    token = await SecureStorageService.getInstance()
        .get("token")
        .then((value) => token = value.toString());
    final response = await http.delete(
      Uri.parse("${apiUrl}announce/$id/$user"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'cookie': token,

      },
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<Announce>> getFavoriteAnnounces(int userId) async {
    List<Announce> announces = [];
    String token = "";
    token = await SecureStorageService.getInstance()
        .get("token")
        .then((value) => token = value.toString());
    final response = await http.get(
      Uri.parse("${apiUrl}announce/all-favorites/$userId",),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'cookie': token,
      },
    );
    if (response.statusCode == 200) {
      List tmpList = json.decode(response.body) as List;
      for (var element in tmpList) {
        announces.add(Announce.fromJson(element));
      }
      return announces;
    }
    return announces;
  }

  Future<bool> deleteFavorite(int announceId, int userId) async {
    String token = "";
    token = await SecureStorageService.getInstance()
        .get("token")
        .then((value) => token = value.toString());
    final response = await http.delete(
      Uri.parse("${apiUrl}announce/delete-favorite/$announceId/$userId",),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'cookie': token,
      },
    );
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<Announce?> postAnnounce(CreateAnnounce createAnnounce, int userId,
      File image) async {
    String token = "";
    token = await SecureStorageService.getInstance()
        .get("token")
        .then((value) => token = value.toString());
    final response = await http.post(
      Uri.parse("${apiUrl}announce/add/$userId"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'cookie': token,
      },
      body: jsonEncode({
        'name': createAnnounce.name ?? '',
        'content': createAnnounce.content ?? '',
        'location': createAnnounce.location ?? '',
        'category': createAnnounce.category ?? '',
        'price': createAnnounce.price ?? '',
      }),
    );
    if (response.statusCode != 200) {
      return null;
    }

    Announce announce = Announce.fromJson(jsonDecode(response.body));
    int announceId = announce.id;

    var request = http.MultipartRequest('POST',
      Uri.parse("${apiUrl}announce/$announceId/add-image/"),);
    request.headers.addAll(<String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'cookie': token,
    });
    request.files.add(await http.MultipartFile.fromPath('image', image.path));

    final responseImage = await request.send();

    if (responseImage.statusCode != 200) {
      return Announce.fromJson(jsonDecode(response.body));
    }

    return await getAnnounce(announceId);
  }


}