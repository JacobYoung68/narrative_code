import 'package:flutter/material.dart';

import 'location.dart';

class LocationForm extends StatefulWidget {
  final locations;
  final Function() notifyParent;

  LocationForm({this.locations, this.notifyParent});

  @override
  _LocationFormState createState() => _LocationFormState();
}

class _LocationFormState extends State<LocationForm> {
  final _formKey = GlobalKey<FormState>();

  String _name;
  String _description;

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(hintText: 'Name'),
      validator: (value) {
        if (value.isEmpty) {
          return 'Name is required.';
        }
        return null;
      },
      onSaved: (value) {
        _name = value;
      },
    );
  }

  Widget _buildDescription() {
    return TextFormField(
      decoration: InputDecoration(hintText: 'Description'),
      validator: (value) {
        if (value.isEmpty) {
          return 'Description is required.';
        }
        return null;
      },
      onSaved: (value) {
        _description = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        width: 500,
        padding: EdgeInsets.all(30),
        color: Colors.grey,
        child: Column(
          children: [
            Text('Create New Location'),
            _buildName(),
            _buildDescription(),
            FlatButton(
              color: Colors.red,
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  setState(() {
                    widget.locations.add(Location(
                        name: '$_name',
                        description: '$_description'));
                    _formKey.currentState.reset();
                  });
                }
                widget.notifyParent();
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
