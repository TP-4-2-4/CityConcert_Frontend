import 'dart:async';
import 'package:my_flutter/src/models/events_list.dart';

import 'event_api_provider.dart';
import '../models/event_model.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();

  Future<EventsList> fetchEventsByName(String searchText) => moviesApiProvider.fetchEventList(searchText);
}