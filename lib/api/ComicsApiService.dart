import 'dart:async';
import 'dart:convert' as convert;
import 'dart:math';
import 'package:flutter_app/models/Comic.dart';
import 'package:http/http.dart' as http;

const MAX_COMICS_NUMBER = 2169;

class ComicsApiService {
  static Future<Comic> fetchComic(int id) async {
    final response = await http.get("https://xkcd.com/$id/info.0.json");
    final json = convert.jsonDecode(response.body);
    return Comic.fromApi(json);
  }

  static Future<Comic> fetchRandomComic() async {
    final comicId = Random().nextInt(MAX_COMICS_NUMBER) + 1;
    return fetchComic(comicId);
  }
}
