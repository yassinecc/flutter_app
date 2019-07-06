import 'package:flutter/material.dart';
import 'package:flutter_app/pages/HomeTabsPage.dart';
import 'package:flutter_app/pages/MapPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Flutter demo", initialRoute: "/", routes: {
      "/": (context) => HomeTabsPage(),
      "/map": (context) => MapPage()
    });
  }
}
