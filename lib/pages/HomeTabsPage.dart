import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/pages/RandomWordsPage.dart';
import 'package:flutter_app/pages/ComicPage.dart';
import 'package:flutter_app/components/CenteredButton.dart';

class HomeTabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter demo'),
        ),
        body: SafeArea(
            child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: TabsWidget(),
        )));
  }
}

class TabsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Function navigateToMap = () => Navigator.pushNamed(context, "/map");
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: TabBarView(
          children: [
            RandomWordsPage(),
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
    );
  }
}
