import 'package:flutter/material.dart';
import 'character.dart';
import 'location.dart';
import 'character_card.dart';
import 'location_card.dart';
import 'left_menu.dart';
import 'character_form.dart';
import 'location_form.dart';

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
  bool eventsIsVisible = false;

  void toggleVisible(x) {
    setState(() {
      if (x == 'Characters') {
        charactersIsVisible = true;
        locationsIsVisible = false;
        eventsIsVisible = false;
      } else if (x == 'Locations') {
        locationsIsVisible = true;
        charactersIsVisible = false;
        eventsIsVisible = false;
      } else if (x == 'Events') {
        locationsIsVisible = false;
        charactersIsVisible = false;
        eventsIsVisible = true;
      }
    });
  }

  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[800],
        appBar: AppBar(
          title: Text(
            'Narrative.Code',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
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
                                CharacterForm(
                                  characters: characters,
                                  notifyParent: refresh,
                                ),
                                Container(
                                  child: Expanded(
                                    child: GridView.count(
                                      crossAxisCount: 2,
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
                                  ),
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
                            child: Row(
                              children: [
                                LocationForm(
                                  locations: locations,
                                  notifyParent: refresh,
                                ),
                                Container(
                                  child: Expanded(
                                    child: GridView.count(
                                      crossAxisCount: 2,
                                      children: locations
                                          .map((locations) => LocationCard(
                                              location: locations,
                                              delete: () {
                                                setState(() {
                                                  characters.remove(locations);
                                                });
                                              }))
                                          .toList(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Visibility(
                          visible: eventsIsVisible,
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
                                LocationForm(
                                  locations: locations,
                                  notifyParent: refresh,
                                ),
                                Container(
                                  child: Expanded(
                                    child: GridView.count(
                                      crossAxisCount: 2,
                                      children: locations
                                          .map((locations) => LocationCard(
                                              location: locations,
                                              delete: () {
                                                setState(() {
                                                  characters.remove(locations);
                                                });
                                              }))
                                          .toList(),
                                    ),
                                  ),
                                ),
                              ],
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
                child: Text(
                  'WIP / Timeline',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
          ],
        ));
  }
}
