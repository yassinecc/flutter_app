import 'dart:async';
import 'dart:math';
import 'dart:convert' show jsonDecode, jsonEncode;
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'package:flutter_app/models/Comic.dart';

const MAX_COMICS_NUMBER = 2176;

final firstDilbert = DateTime.utc(1989, 04, 16);

class ComicsApiService {
  static String getRandomUrl(String type) {
    switch (type) {
      case "xkcd":
        final comicId = Random().nextInt(MAX_COMICS_NUMBER) + 1;
        return "https://xkcd.com/$comicId/info.0.json";
      case "dilbert":
        final daysDifference = DateTime.now().difference(firstDilbert).inDays;
        final randomDuration = 1 + Random().nextInt(daysDifference);
        final date = firstDilbert.add(Duration(days: randomDuration));
        return "https://dilbert.com/strip/${date.year}-${date.month}-${date.day}";
      default:
        print("Not recognized");
        return "";
    }
  }

  static dynamic convertComicPayload(String type, http.Response response) {
    String body = response.body;
    switch (type) {
      case "xkcd":
        final bodyJson = jsonDecode(body);
        return {
          "id": bodyJson["num"].toString(),
          "title": bodyJson["title"],
          "src": bodyJson["img"]
        };
      case "dilbert":
        final htmlTree = parse(body);
        final id = htmlTree
            .querySelector(".comic-item-container")
            .attributes["data-id"];
        final imageTag = htmlTree.querySelector(".img-responsive");
        final title = imageTag.attributes["alt"];
        final localSource = imageTag.attributes["src"];
        final source = "https:$localSource";
        return {"id": id, "title": title, "src": source};
      default:
        print("Unrecognized type");
        return null;
    }
  }

  static Future<Comic> fetchComic(String type, String url) async {
    final response = await http.get(url);
    final convertedPayload = convertComicPayload(type, response);
    return Comic.fromApi(convertedPayload);
  }

  static Future<Comic> fetchRandomComic(String type) async {
    final url = getRandomUrl(type);
    return fetchComic(type, url);
  }
}
