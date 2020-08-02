import 'location.dart';
import 'character.dart';

class Event {
  String name;
  DateTime date;
  Location location;
  String description;
  List<Character> charactersInvolved;

  Event({this.name, this.date, this.location, this.description, this.charactersInvolved});
}
