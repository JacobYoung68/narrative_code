import 'package:flutter/material.dart';
import 'character.dart';
import 'character_card.dart';

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
                      child: Text('Hello'),
                    ),
                  ),
                  Expanded(
                    flex: 3,
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
                        children: characters
                            .map((character) =>
                                CharacterCard(character: character))
                            .toList(),
                      ),
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

