import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';

class DestinationModel extends Model {
  List<String> _destinations = [];

  List<String> get() => _destinations;

  void addDestination(String destination) {
    _destinations.add(destination);
    notifyListeners();
  }

  static DestinationModel of(BuildContext context) =>
      ScopedModel.of<DestinationModel>(context);
}
