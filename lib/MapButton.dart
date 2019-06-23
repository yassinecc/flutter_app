import 'package:flutter/material.dart';

class MapButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final onPress = () => Navigator.of(context).pushNamed('/map');
    return FlatButton(child: const Text("Open map"), onPressed: onPress);
  }
}
