import 'dart:ui';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/api/ComicsApiService.dart';
import 'package:flutter_app/models/Comic.dart';

class ComicPage extends StatefulWidget {
  @override
  _ComicPageState createState() => _ComicPageState();
}

class _ComicPageState extends State<ComicPage> {
  var _imageUrl = "";

  Future<void> _fetchComic() async {
    final Comic comic = await ComicsApiService.fetchComic();
    setState(() {
      _imageUrl = comic.url;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            Center(child: (_imageUrl != "") ? Image.network(_imageUrl) : null),
        floatingActionButton: FloatingActionButton.extended(
            label: Text("Load comic"), onPressed: _fetchComic));
  }
}
