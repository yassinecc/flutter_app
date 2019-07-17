import 'package:flutter/material.dart';

class ComicChoiceButton extends StatelessWidget {
  final String source;
  final Function onPressed;
  const ComicChoiceButton(
      {Key key, @required this.source, @required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Image.asset(
        source,
        scale: 2,
      ),
      onPressed: onPressed,
    );
  }
}

class ComicChoicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          ComicChoiceButton(
            source: 'assets/xkcd.png',
            onPressed: () =>
                Navigator.pushNamed(context, "/comics", arguments: "xkcd"),
          ),
          ComicChoiceButton(
              source: 'assets/dilbert.jpg',
              onPressed: () => Navigator.pushNamed(context, "/comics",
                  arguments: "dilbert")),
        ],
      ),
    );
  }
}
