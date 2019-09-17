import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/pages/HomeTabsPage.dart';
import 'package:flutter_app/pages/MapPage.dart';
import 'package:flutter_app/store/DestinationModel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_app/pages/ComicPage.dart';
import 'package:sentry/sentry.dart';

final SentryClient _sentry = new SentryClient(
    dsn:
        "https://5f72561726e04e0a89f321c7e00d8da9:efe25d57122e4f76a1ea4a88e994c405@sentry.io/1728806");

/// Reports [error] along with its [stackTrace] to Sentry.io.
Future<Null> _reportError(dynamic error, dynamic stackTrace) async {
  print('Caught error: $error');

  print('Reporting to Sentry.io...');

  final SentryResponse response = await _sentry.captureException(
    exception: error,
    stackTrace: stackTrace,
  );

  if (response.isSuccessful) {
    print('Success! Event ID: ${response.eventId}');
  } else {
    print('Failed to report to Sentry.io: ${response.error}');
  }
}

void main() async {
  FlutterError.onError = (FlutterErrorDetails details) async {
    // In development mode simply print to console.
    Zone.current.handleUncaughtError(details.exception, details.stack);
  };
  runZoned(() async {
    runApp(MyApp());
  }, onError: (error, stackTrace) => _reportError(error, stackTrace));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Flutter demo", initialRoute: "/", routes: {
      "/": (context) => ScopedModel<DestinationModel>(
          model: DestinationModel(), child: HomeTabsPage()),
      "/map": (context) => MapPage(),
      "/comics": (context) => ComicPage(),
    });
  }
}
