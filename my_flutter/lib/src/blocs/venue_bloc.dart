import 'dart:ffi';

import 'package:rxdart/rxdart.dart';

import '../models/lists/venues_list.dart';
import '../models/venue_model.dart';
import '../resources/repositories/venue_repository.dart';

class VenueBloc {
  final _repository = Repository();
  final _venuesFetcher = PublishSubject<VenuesList>();
  final _venueFetcher = PublishSubject<VenueModel>();
  Stream<VenuesList> get venues => _venuesFetcher.stream;
  Stream<VenueModel> get venue => _venueFetcher.stream;
  fetchVenues() async {
    VenuesList itemModel = await _repository.fetchVenues();
    _venuesFetcher.sink.add(itemModel);
  }
  fetchVenueById(Long id) async {
    VenueModel venue = await _repository.fetchVenue(id);
    _venueFetcher.sink.add(venue);
  }
  addVenue(VenueModel venue) async {
    VenueModel e = await _repository.addVenue(venue);
    _venueFetcher.sink.add(e);
  }
  deleteVenueById(Long id) async {
    VenueModel venue = await _repository.deleteVenue(id);
    _venueFetcher.sink.add(venue);
  }
  updateVenue(VenueModel venue) async {
    VenueModel e = await _repository.updateVenue(venue);
    _venueFetcher.sink.add(e);
  }

  dispose() {
    _venuesFetcher.close();
    _venueFetcher.close();
  }
}

final bloc = VenueBloc();