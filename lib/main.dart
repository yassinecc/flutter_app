import 'package:flutter/material.dart';
import './RandomWords.dart';
import './MapSample.dart';

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
        body: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: DefaultTabController(
            length: 3,
            child: Scaffold(
              body: TabBarView(
                children: [
                  RandomWords(),
                  new CenteredButton(navigateToMap: navigateToMap),
                  Icon(Icons.directions_bike),
                ],
              ),
              bottomNavigationBar: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.directions_car)),
                  Tab(icon: Icon(Icons.map)),
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

class CenteredButton extends StatelessWidget {
  const CenteredButton({
    Key key,
    @required this.navigateToMap,
  }) : super(key: key);

  final Function navigateToMap;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: FloatingActionButton.extended(
            label: const Text(
              "Open map",
              style: TextStyle(color: Colors.white, letterSpacing: 0.5),
            ),
            onPressed: navigateToMap));
  }
}
