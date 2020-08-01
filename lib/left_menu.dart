import 'package:flutter/material.dart';

class LeftMenu extends StatelessWidget {
  final Function toggleVisible;

  LeftMenu({this.toggleVisible});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RaisedButton(
            onPressed: () {
              toggleVisible('Characters');
            },
            padding: EdgeInsets.fromLTRB(200, 50, 200, 50),
            child: Text('Characters'),
          ),
          RaisedButton(
            onPressed: () {
              toggleVisible('Locations');
            },
            padding: EdgeInsets.fromLTRB(200, 50, 200, 50),
            child: Text('Locations'),
          ),
          RaisedButton(
            onPressed: () {},
            padding: EdgeInsets.fromLTRB(200, 50, 200, 50),
            child: Text('Events'),
          ),
          RaisedButton(
            onPressed: () {},
            padding: EdgeInsets.fromLTRB(200, 50, 200, 50),
            child: Text('Objects'),
          ),
        ],
      ),
    );
  }
}
