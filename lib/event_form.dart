import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'location.dart';
import 'character.dart';
import 'event.dart';

class EventForm extends StatefulWidget {
  final event;
  final Function() notifyParent;

  EventForm({this.event, this.notifyParent});

  @override
  _EventFormState createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
  final _formKey = GlobalKey<FormState>();

  String _name;
  DateTime _date;
  Location _location;
  String _description;
  List<Character> _charactersInvolved;

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

  Widget _buildDate() {
    return DateField(
      onDateSelected: (value) {
        setState(() {
          _date = value.toUtc();
        });
      },
      selectedDate: _date,
    );
  }

  List<Location> testLocations = [
    Location(name: 'Hogwarts', description: 'here is a great description'),
    Location(name: 'Neverland', description: 'here is a great description'),
    Location(name: 'Stormwind', description: 'here is a great description')
  ];

  String dropDownValue = 'Location';

  Widget _buildLocation() {
    return DropdownButton(
        hint: Text(dropDownValue),
        items: testLocations.map<DropdownMenuItem<String>>((value) {
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
            for (int i = 0; i < testLocations.length; i++) {
              if (testLocations[i].name == value) {
                _location = testLocations[i];
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

  List<Character> testList = [
    Character(name: 'Roger', age: 10, description: 'nice description'),
    Character(name: 'Ben', age: 32, description: 'other description'),
    Character(name: 'Del', age: 51, description: 'bad description too'),
  ];



  Widget _buildCharacterList() {
    return Column(
      children: testList
          .map((character) => CheckboxListTile(
                title: Text(character.name),
                onChanged: (value) {
                  setState(() {
                    value = !value;
                    for (int i = 0; i < testList.length; i++) {
                      if (testList[i].name == character.name) {
                        _charactersInvolved.add(testList[i]);
                      }
                    }
                  });
                },
              ))
          .toList(),
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
            _buildCharacterList(),
            FlatButton(
              color: Colors.red,
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  setState(() {
                    widget.event.add(Event(
                        name: _name,
                        date: DateTime.parse('$_date'),
                        location: _location,
                        description: _description,
                        charactersInvolved: _charactersInvolved));
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
