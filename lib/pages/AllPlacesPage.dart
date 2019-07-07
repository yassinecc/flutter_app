import 'package:flutter/material.dart';
import 'package:flutter_app/store/DestinationModel.dart';

class AllPlacesPage extends StatelessWidget {
  @override
  Widget build(context) {
    return Container(margin: EdgeInsets.all(16.0), child: AllPlacesList());
  }
}

class AllPlacesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> data = DestinationModel.of(context).get();
    return data.length > 0
        ? ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) => Text(data[index]),
          )
        : Text("No items added!");
  }
}
