import 'dart:ffi';

import 'package:my_flutter/src/models/event_model.dart';
import 'package:my_flutter/src/models/lists/events_list.dart';

import '../resources/repositories/event_repository.dart';
import 'package:rxdart/rxdart.dart';

class EventBloc {
  final _repository = Repository();
  final _eventsFetcher = PublishSubject<EventsList>();
  final _eventFetcher = PublishSubject<EventModel>();
  Stream<EventsList> get events => _eventsFetcher.stream;

  fetchEventsByName(String searchText) async {
    EventsList events = await _repository.fetchEventsByName(searchText);
    _eventsFetcher.sink.add(events);
  }
  fetchEventsGetAll(String searchText) async {
    EventsList events = await _repository.fetchEventsListAll();
    _eventsFetcher.sink.add(events);
  }
  fetchEventsByFilter() async {
    EventsList events = await _repository.fetchEventsListByFilter();
    _eventsFetcher.sink.add(events);
  }
  fetchEventById(Long id) async {
    EventModel event = await _repository.fetchEvent(id);
    _eventFetcher.sink.add(event);
  }
  addEvent(EventModel event) async {
    EventModel e = await _repository.addEvent(event);
    _eventFetcher.sink.add(e);
  }
  deleteEventById(Long id) async {
    EventModel event = await _repository.deleteEvent(id);
    _eventFetcher.sink.add(event);
  }
  updateEvent(EventModel event) async {
    EventModel e = await _repository.updateEvent(event);
    _eventFetcher.sink.add(e);
  }

  dispose() {
    _eventsFetcher.close();
  }
}

final bloc = EventBloc();