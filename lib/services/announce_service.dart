import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:weapon_marketplace/models/announce.dart';
import 'package:weapon_marketplace/models/sign_up.dart';
import 'package:weapon_marketplace/services/secure_storage.dart';

import '../models/sign_in.dart';
import '../models/user.dart';


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

    print(token);
    print(response.statusCode);

    if(response.statusCode == 200 ){
      return Announce.fromJson(jsonDecode(response.body));
    }
    return null;
  }
}