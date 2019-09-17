import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new RaisedButton(
            child: new Text('Dart exception'),
            elevation: 1.0,
            onPressed: () {
              throw new StateError('This is a Dart exception.');
            },
          ),
          new RaisedButton(
            child: new Text('async Dart exception'),
            elevation: 1.0,
            onPressed: () async {
              foo() async {
                throw new StateError('This is an async Dart exception.');
              }

              bar() async {
                await foo();
              }

              await bar();
            },
          ),
          new RaisedButton(
            child: new Text('Java exception'),
            elevation: 1.0,
            onPressed: () async {
              final channel = const MethodChannel('crashy-custom-channel');
              await channel.invokeMethod('blah');
            },
          ),
        ],
      ),
    );
  }
}
