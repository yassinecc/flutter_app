import 'package:flutter/material.dart';

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
