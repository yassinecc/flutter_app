import 'dart:async';
import 'dart:convert' as convert;
import 'package:flutter_app/models/Comic.dart';
import 'package:http/http.dart' as http;

class ComicsApiService {
  static Future<Comic> fetchComic() async {
    final response = await http.get("https://xkcd.com/614/info.0.json");
    final json = convert.jsonDecode(response.body);
    return Comic.fromApi(json);
  }
}
