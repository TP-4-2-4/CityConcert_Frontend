import 'dart:async';
import 'dart:ffi';
import 'package:my_flutter/src/models/event_model.dart';
import 'package:my_flutter/src/models/lists/events_list.dart';

import '../api_providers/event_api_provider.dart';

class Repository {
  final eventsApiProvider = EventApiProvider();

  Future<EventsList> fetchEventsByName(String searchText) => eventsApiProvider.fetchEventListByName(searchText);
  Future<EventsList> fetchEventsListAll() => eventsApiProvider.fetchEventListAll();
  Future<EventsList> fetchEventsListByFilter() => eventsApiProvider.fetchEventListByFilter();
  Future<EventModel> fetchEvent(Long id) => eventsApiProvider.fetchEvent(id);
  Future<EventModel> deleteEvent(Long id) => eventsApiProvider.deleteEvent(id);
  Future<EventModel> addEvent(EventModel event) => eventsApiProvider.addEvent(event);
  Future<EventModel> updateEvent(EventModel event) => eventsApiProvider.updateEvent(event);
}