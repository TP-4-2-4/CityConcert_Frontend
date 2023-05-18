import '../resources/event_repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/event_model.dart';

class EventBloc {
  final _repository = Repository();
  final _eventsFetcher = PublishSubject<event_model>();

  Stream<event_model> get events => _eventsFetcher.stream;

  fetchEventsByName(String searchText) async {
    event_model itemModel = await _repository.fetchEventsByName(searchText);
    _eventsFetcher.sink.add(itemModel);
  }

  dispose() {
    _eventsFetcher.close();
  }
}

final bloc = EventBloc();