import 'package:flutter/material.dart';

class LeftMenu extends StatelessWidget {
  final Function toggleVisible;

  LeftMenu({this.toggleVisible});

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: [
          RaisedButton(
            onPressed: () {
              toggleVisible('Characters');
            },
            child: Text('Characters'),
          ),
          RaisedButton(
            onPressed: () {
              toggleVisible('Locations');
            },
            child: Text('Locations'),
          ),
          RaisedButton(
            onPressed: () {
              toggleVisible('Events');
            },
            child: Text('Events'),
          ),
        ],
    );
  }
}
