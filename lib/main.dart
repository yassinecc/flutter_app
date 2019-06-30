import 'package:flutter/material.dart';
import './RandomWords.dart';
import './MapSample.dart';
import './CenteredButton.dart';
import './ComicPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Flutter demo", initialRoute: "/", routes: {
      "/": (context) => TabBarDemo(),
      "/map": (context) => MapSample()
    });
  }
}

class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Function navigateToMap = () => Navigator.pushNamed(context, "/map");
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter demo'),
        ),
        body: SafeArea(
            child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: DefaultTabController(
            length: 3,
            child: Scaffold(
              body: TabBarView(
                children: [
                  RandomWords(),
                  CenteredButton(navigateToMap: navigateToMap),
                  ComicPage(),
                ],
              ),
              bottomNavigationBar: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.desktop_windows)),
                  Tab(icon: Icon(Icons.map)),
                  Tab(icon: Icon(Icons.book)),
                ],
                labelColor: Colors.lightBlue,
                unselectedLabelColor: Colors.black,
                indicatorColor: Color(0),
              ),
            ),
          ),
        )));
  }
}
