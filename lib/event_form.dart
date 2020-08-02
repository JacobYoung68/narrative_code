import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'location.dart';
import 'character.dart';
import 'package:intl/intl.dart';
import 'event.dart';

class EventForm extends StatefulWidget {
  final events;
  final characters;
  final locations;
  final Function notifyParent;

  EventForm({this.events, this.characters, this.locations, this.notifyParent});

  @override
  _EventFormState createState() => _EventFormState(characters: characters);
}

class _EventFormState extends State<EventForm> {
  final _formKey = GlobalKey<FormState>();

  List<Character> characters;

  _EventFormState({this.characters});

  String _name;
  DateTime _date;
  Location _location;
  String _description;
  List<Character> _charactersInvolved = [];

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

  final format = DateFormat("yyyy-MM-dd");

  Widget _buildDate() {
    return Container(
      height: 100,
      child: Column(
        children: [
          Text('Basic date field (${format.pattern})'),
          DateTimeField(
            format: format,
            onShowPicker: (context, currentValue) {
              return showDatePicker(
                  context: context,
                  firstDate: DateTime(1900),
                  initialDate: currentValue ?? DateTime.now(),
                  lastDate: DateTime(2100));
            },
            onSaved: (value) {
              _date = value;
            },
          ),
        ],
      ),
    );
  }

  String dropDownValue = 'Location';

  Widget _buildLocation() {
    return DropdownButton(
        hint: Text(dropDownValue),
        items: widget.locations.map<DropdownMenuItem<String>>((value) {
          return DropdownMenuItem<String>(
            value: value.name,
            child: Text(value.name),
          );
        }).toList(),
        icon: Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (value) {
          setState(() {
            for (int i = 0; i < widget.locations.length; i++) {
              if (widget.locations[i].name == value) {
                _location = widget.locations[i];
                dropDownValue = value;
              }
            }
          });
        });
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

  var checked = new List<bool>.filled(19, false, growable: true);

  Widget _buildCharacterList() {
    return Container(
      height: 150,
      child: ListView.builder(
        itemCount: characters.length,
        itemBuilder: (context, i) {
          return CheckboxListTile(
            value: checked[i],
            title: Text(characters[i].name),
            onChanged: (bool value){
              setState(() {
                checked[i] =! checked[i];
                _charactersInvolved.add(characters[i]);
              });
            },
          );
        },
      ),
    );
  }

  void saveNewEvent() {
    setState(() {
      widget.events.add(Event(
          name: _name,
          date: DateTime.parse('$_date'),
          location: _location,
          description: _description,
          charactersInvolved: _charactersInvolved));
    });
    print('Name: $_name');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        width: 500,
        padding: EdgeInsets.all(30),
        color: Colors.grey,
        child: ListView(
          children: [
            Text('Create New Character'),
            SizedBox(
              height: 20,
            ),
            _buildName(),
            SizedBox(
              height: 20,
            ),
            _buildLocation(),
            SizedBox(
              height: 20,
            ),
            _buildDate(),
            SizedBox(
              height: 20,
            ),
            _buildDescription(),
            SizedBox(
              height: 20,
            ),
            Text('Select Present Characters'),
            SizedBox(
              height: 20,
            ),
            _buildCharacterList(),
            FlatButton(
              color: Colors.red,
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  saveNewEvent();
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
