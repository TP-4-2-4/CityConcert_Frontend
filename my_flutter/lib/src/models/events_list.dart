import 'package:my_flutter/src/models/event_model.dart';

class EventsList {
  late final List<event_model> events;


  EventsList.fromJson(List<dynamic> json) {
  events = json.map((i)=>event_model.fromJson(i as Map<String, dynamic>)).toList();
  }
  EventsList(
      {
    required this.events
  }
  );
}
