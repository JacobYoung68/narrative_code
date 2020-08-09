import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'character.dart';

class CharacterForm extends StatefulWidget {
  final characters;
  final Function() notifyParent;

  CharacterForm({this.characters, this.notifyParent});

  @override
  _CharacterFormState createState() => _CharacterFormState();
}

class _CharacterFormState extends State<CharacterForm> {
  final _formKey = GlobalKey<FormState>();

  String _name;
  int _age;
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

  Widget _buildAge() {
    return TextFormField(
      decoration: InputDecoration(hintText: 'Age'),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly
      ],
      validator: (value) {
        if (value.isEmpty) {
          return 'Age is required.';
        }
        return null;
      },
      onSaved: (value) {
        _age = int.parse(value);
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
            Text('Create New Character'),
            _buildName(),
            _buildAge(),
            _buildDescription(),
            FlatButton(
              color: Colors.red,
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  setState(() {
                    widget.characters.add(Character(
                        name: '$_name',
                        age: int.parse('$_age'),
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
