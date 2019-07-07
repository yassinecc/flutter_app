import 'package:flutter/material.dart';
import 'package:flutter_app/components/CenteredButton.dart';
import 'package:flutter_app/store/DestinationModel.dart';

class PlacesSelectionPage extends StatefulWidget {
  @override
  _PlacesSelectionPageState createState() => _PlacesSelectionPageState();
}

class _PlacesSelectionPageState extends State<PlacesSelectionPage> {
  String _fieldText = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          TextField(
            onChanged: (value) {
              setState(() {
                _fieldText = value;
              });
            },
            decoration: InputDecoration(hintText: "Add a destination"),
          ),
          RaisedButton(
            child: Text("Add"),
            onPressed: () =>
                DestinationModel.of(context).addDestination(_fieldText),
          ),
          CenteredButton(
              navigateToMap: () => Navigator.pushNamed(context, "/map")),
        ],
      ),
    );
  }
}
