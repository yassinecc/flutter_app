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

  Future<void> _fetchComic(String type) async {
    setState(() {
      _isLoading = true;
    });
    final Comic comic = await ComicsApiService.fetchRandomComic(type);
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
    final String screenArgs = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(title: Text(screenArgs)),
        body: Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment(0, 0),
            child: _isLoading
                ? CircularProgressIndicator()
                : SingleChildScrollView(child: _buildComic())),
        floatingActionButton: FloatingActionButton.extended(
            label: Text("Load comic"),
            backgroundColor:
                _isLoading ? Color.fromRGBO(120, 120, 120, 1) : null,
            onPressed: _isLoading ? null : () => _fetchComic(screenArgs)));
  }
}
