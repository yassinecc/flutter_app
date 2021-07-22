import 'package:flutter/material.dart';
import 'package:flutter_app/pages/AllPlacesPage.dart';
import 'package:flutter_app/pages/PlacesSelectionPage.dart';
import 'package:flutter_app/pages/RandomWordsPage.dart';
import 'package:flutter_app/pages/ComicChoicePage.dart';

class HomeTabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Function navigateToMap = () => Navigator.pushNamed(context, "/map");
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter demo'),
        ),
        body: SafeArea(
          child: TabsWidget(navigateToMap: navigateToMap),
        ));
  }
}

class TabsWidget extends StatelessWidget {
  const TabsWidget({Key key, @required this.navigateToMap}) : super(key: key);
  final Function navigateToMap;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: TabBarView(
          children: [
            RandomWordsPage(),
            ComicChoicePage(),
            PlacesSelectionPage(),
            AllPlacesPage()
          ],
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(icon: Icon(Icons.desktop_windows)),
            Tab(icon: Icon(Icons.book)),
            Tab(icon: Icon(Icons.map)),
            Tab(icon: Icon(Icons.list)),
          ],
          labelColor: Colors.lightBlue,
          unselectedLabelColor: Colors.black,
          indicatorColor: Color(0),
        ),
      ),
    );
  }
}
