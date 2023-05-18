import 'dart:async';
import 'event_api_provider.dart';
import '../models/event_model.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();

  Future<event_model> fetchEventsByName(String searchText) => moviesApiProvider.fetchEventList(searchText);
}