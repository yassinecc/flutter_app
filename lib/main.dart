import 'package:flutter/material.dart';
import './RandomWords.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TabBarDemo());
  }
}

class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter demo'),
        ),
        body: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: DefaultTabController(
            length: 3,
            child: Scaffold(
              body: TabBarView(
                children: [
                  RandomWords(),
                  Icon(Icons.directions_transit),
                  Icon(Icons.directions_bike),
                ],
              ),
              bottomNavigationBar: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.directions_car)),
                  Tab(icon: Icon(Icons.directions_transit)),
                  Tab(icon: Icon(Icons.directions_bike)),
                ],
                labelColor: Colors.lightBlue,
                unselectedLabelColor: Colors.black,
              ),
            ),
          ),
        ));
  }
}
