import 'dart:convert';
import 'dart:io';

import 'package:flutter_webapi_first_course/models/vestibular.dart';
import 'package:flutter_webapi_first_course/services/webclient.dart';
import 'package:http/http.dart' as http;

class VestibularService {
  String url = WebClient.url;
  static const String resource = "vestibulares/";

  http.Client client = WebClient().client;

  String getUrl() {
    return "$url$resource";
  }

  Future<bool> register(Vestibular vestibular, String token) async {
    String jsonVestibular = json.encode(vestibular.toMap());
    http.Response response = await client.post(Uri.parse(getUrl()),
        headers: {
          'Content-type': 'application/json', "Authorization": "Bearer $token",
        },
        body: jsonVestibular
    );
    if (response.statusCode != 201) {
      if (json.decode(response.body) == "jwt expired") {
        throw TokenNotValidException();
      }
      throw HttpException(response.body);
    }
    return true;
  }

  Future<List<Vestibular>> getAll({required String token}) async {
    http.Response response = await client.get(
        Uri.parse(getUrl()),
        headers: {
          "Authorization": "Bearer $token",
        }
    );

    if (response.statusCode != 200) {
      if (json.decode(response.body) == "jwt expired") {
        throw TokenNotValidException();
      }
      throw HttpException(response.body);
    }

    List<Vestibular> list = [];
    List<dynamic> listDynamic = json.decode(response.body);

    for (var jsonMap in listDynamic) {
      list.add(Vestibular.fromMap(jsonMap));
    }
    return list;
  }

  Future<bool> edit(String id, Vestibular vestibular, String token) async {
    String jsonVestibular = json.encode(vestibular.toMap());

    http.Response response = await client.put(
        Uri.parse("${getUrl()}$id"),
        headers: {
          'Content-type': 'application/json', "Authorization": "Bearer $token",
        },
        body: jsonVestibular
    );

    if (response.statusCode != 200) {
      if (json.decode(response.body) == "jwt expired") {
        throw TokenNotValidException();
      }
      throw HttpException(response.body);
    }
    return true;
  }

  Future<bool> delete(String id, String token) async {
    http.Response response = await http.delete(Uri.parse("${getUrl()}$id"),
        headers: {"Authorization": "Bearer $token"}
    );

    if (response.statusCode != 200) {
      if (json.decode(response.body) == "jwt expired") {
        throw TokenNotValidException();
      }
      throw HttpException(response.body);
    }
    return true;
  }
}

class TokenNotValidException implements Exception {}
