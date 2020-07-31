import 'package:flutter/material.dart';
import 'dart:math';

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
  int age = 0;
  List<int> ageList = [11,14,21,45];

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
                        children: [
                          Text(
                            'Name',
                            style: TextStyle(
                              fontSize: 16,
                              letterSpacing: 4,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Jacob',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.amber[200],
                            ),
                          ),
                          SizedBox(height: 30),
                          Text(
                            'Age',
                            style: TextStyle(
                              fontSize: 16,
                              letterSpacing: 4,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '$age',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.amber[200],
                            ),
                          ),
                          SizedBox(height: 30),
                          Text(
                            'Description',
                            style: TextStyle(
                              fontSize: 16,
                              letterSpacing: 4,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '..........',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.amber[200],
                            ),
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                var rng = new Random();
                                age = ageList[rng.nextInt(ageList.length)];
                              });
                            },
                            child: Icon(
                              Icons.add,
                            ),
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                age = 0;
                              });
                            },
                            child: Icon(
                              Icons.clear,
                            ),
                          )
                        ],
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
