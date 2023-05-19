import 'package:my_flutter/src/models/events_list.dart';

import '../resources/event_repository.dart';
import 'package:rxdart/rxdart.dart';

class EventBloc {
  final _repository = Repository();
  final _eventsFetcher = PublishSubject<EventsList>();

  Stream<EventsList> get events => _eventsFetcher.stream;

  fetchEventsByName(String searchText) async {
    EventsList itemModel = await _repository.fetchEventsByName(searchText);
    _eventsFetcher.sink.add(itemModel);
  }

  dispose() {
    _eventsFetcher.close();
  }
}

final bloc = EventBloc();