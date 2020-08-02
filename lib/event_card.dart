import 'dart:html';
import 'event.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final Event event;
  final Function delete;

  EventCard({this.event, this.delete});

  List<Widget> _getCharactersInvolved() {
    //add check if it null
    List listings = List<Widget>();
    if (event.charactersInvolved.isEmpty) {
    } else {
      int limit = event.charactersInvolved.length;
      for (int i = 0; i < limit; i++) {
        listings.add(Text(event.charactersInvolved[i].name));
      }
    }
    return listings;
  }

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
              event.name,
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              event.date.toString(),
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              event.location.name,
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              event.description,
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            Column(
              children: _getCharactersInvolved(),
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
