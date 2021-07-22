import 'package:flutter/material.dart';
import 'package:flutter_app/pages/HomeTabsPage.dart';
import 'package:flutter_app/pages/MapPage.dart';
import 'package:flutter_app/store/DestinationModel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_app/pages/ComicPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Flutter demo", initialRoute: "/", routes: {
      "/": (context) => ScopedModel<DestinationModel>(
          model: DestinationModel(), child: HomeTabsPage()),
      "/map": (context) => MapPage(),
      "/comics": (context) => ComicPage(),
    });
  }
}
