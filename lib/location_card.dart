import 'package:flutter/material.dart';
import 'location.dart';

class LocationCard extends StatelessWidget {
  final Location location;
  final Function delete;

  LocationCard({this.location, this.delete});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 400,
      child: Card(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              location.name,
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              location.description,
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            FlatButton.icon(
              onPressed: delete,
              icon: Icon(Icons.delete),
              label: Text('Delete'),
            ),
          ],
        ),
      ),
    );
  }
}
