import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weapon_marketplace/models/announce.dart';
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
      Uri.parse(apiUrl + "announce/" + announceId.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'cookie': token,
      },
    );
    if(response.statusCode == 200 ){
      return Announce.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  Future<List<Announce>> getAnnounces(Search search) async {
    List<Announce> announces = [];
    String token = "";
    print(search);
    token = await SecureStorageService.getInstance()
        .get("token")
        .then((value) => token = value.toString());
    final response = await http.post(
      Uri.parse(apiUrl + "announce/search",),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'cookie': token,
      },
      body:  jsonEncode({
        'title': search.title ?? '',
        'regionId': search.regionId ?? null,
        'maxPrice': search.maxPrice ?? 0,
        'minPrice': search.minPrice ?? 0,
        'userId': search.userId ?? null,
        })
    );
    if(response.statusCode == 200 ){
      List tmpList = json.decode(response.body) as List;
      for (var element in tmpList) { announces.add(Announce.fromJson(element)); }
      return announces;
    }
    return announces;
  }

  Future<bool> deleteAnnounce(int id, int? user) async{
    String token = "";
    token = await SecureStorageService.getInstance()
        .get("token")
        .then((value) => token = value.toString());
    print(token);
    final response = await http.delete(
        Uri.parse("${apiUrl}announce/$id/$user"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'cookie': token,

        },
    );
    if(response.statusCode == 200) {
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
        Uri.parse(apiUrl + "announce/all-favorites/" + userId.toString(),),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'cookie': token,
        },
    );
    if(response.statusCode == 200 ){
      List tmpList = json.decode(response.body) as List;
      for (var element in tmpList) { announces.add(Announce.fromJson(element)); }
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
    if(response.statusCode == 200 ){
      return true;
    }
    return false;
  }


}