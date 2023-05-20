import 'package:my_flutter/src/models/event_model.dart';

class EventsList {
  late final List<EventModel> events;


  EventsList.fromJson(List<dynamic> json) {
  events = json.map((i)=>EventModel.fromJson(i as Map<String, dynamic>)).toList();
  }
  EventsList(
      {
    required this.events
  }
  );
}
