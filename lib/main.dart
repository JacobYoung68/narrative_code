import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'character.dart';
import 'location.dart';
import 'character_card.dart';
import 'location_card.dart';
import 'left_menu.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Character> characters = [
    Character(name: 'Jacob', age: 21, description: 'this is a description'),
    Character(name: 'Bob', age: 44, description: 'hello'),
  ];

  List<Location> locations = [
    Location(name: 'Manchester', description: 'this is a description'),
    Location(name: 'Holmes Chapel', description: 'this is another description'),
  ];

  bool charactersIsVisible = true;
  bool locationsIsVisible = false;

  void toggleVisible(x) {
    setState(() {
      if (x == 'Characters') {
        charactersIsVisible = true;
        locationsIsVisible = false;
      } else if (x == 'Locations') {
        locationsIsVisible = true;
        charactersIsVisible = false;
      }
    });
  }

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
    return Scaffold(
        backgroundColor: Colors.grey[800],
        appBar: AppBar(
          title: Text('Narrative.Code'),
          backgroundColor: Colors.grey[900],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 3,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                          color: Colors.grey[400],
                          border: Border.all(
                            width: 10,
                            color: Colors.green,
                          )),
                      child: LeftMenu(toggleVisible: toggleVisible),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Visibility(
                          visible: charactersIsVisible,
                          child: Container(
                            padding: EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                color: Colors.grey[800],
                                border: Border.all(
                                  width: 10,
                                  color: Colors.blue,
                                )),
                            child: Row(
                              children: [
                                Container(
                                    child: Form(
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
                                            if (_formKey.currentState
                                                .validate()) {
                                              _formKey.currentState.save();
                                              characters.add(Character(
                                                  name: '$_name',
                                                  age: int.parse('$_age'),
                                                  description:
                                                      '$_description'));
                                              print(characters[2].name);
                                            }
                                          },
                                          child: Text('Submit'),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: characters
                                      .map((character) => CharacterCard(
                                          character: character,
                                          delete: () {
                                            setState(() {
                                              characters.remove(character);
                                            });
                                          }))
                                      .toList(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Visibility(
                          visible: locationsIsVisible,
                          child: Container(
                            padding: EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                color: Colors.grey[800],
                                border: Border.all(
                                  width: 10,
                                  color: Colors.blue,
                                )),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: locations
                                  .map((location) => LocationCard(
                                      location: location,
                                      delete: () {
                                        setState(() {
                                          locations.remove(location);
                                        });
                                      }))
                                  .toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                    color: Colors.grey[400],
                    border: Border.all(
                      width: 10,
                      color: Colors.orange,
                    )),
                child: Text('Hello'),
              ),
            ),
          ],
        ));
  }
}
