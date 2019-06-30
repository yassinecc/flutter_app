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
  var _title = "";
  var _isLoading = false;

  Future<void> _fetchComic() async {
    setState(() {
      _isLoading = true;
    });
    final Comic comic = await ComicsApiService.fetchRandomComic();
    setState(() {
      _imageUrl = comic.url;
      _title = comic.title;
      _isLoading = false;
    });
  }

  Widget _buildComic() {
    return (_imageUrl != "")
        ? Column(children: <Widget>[
            Image.network(_imageUrl),
            Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  _title,
                ))
          ])
        : Text("Load a comic by pressing the below button");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment(0, 0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _isLoading ? CircularProgressIndicator() : _buildComic()
                ])),
        floatingActionButton: FloatingActionButton.extended(
            label: Text("Load comic"), onPressed: _fetchComic));
  }
}
