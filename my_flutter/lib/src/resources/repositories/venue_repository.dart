import 'dart:async';
import 'dart:ffi';
import 'package:my_flutter/src/models/lists/venues_list.dart';

import '../../models/venue_model.dart';
import '../api_providers/venue_api_provider.dart';

class Repository {
  final venuesApiProvider = VenueApiProvider();

  Future<VenuesList> fetchVenues() => venuesApiProvider.fetchVenueList();
  Future<VenueModel> fetchVenue(Long id) => venuesApiProvider.fetchVenue(id);
  Future<VenueModel> deleteVenue(Long id) => venuesApiProvider.deleteVenue(id);
  Future<VenueModel> addVenue(VenueModel venue) => venuesApiProvider.addVenue(venue);
  Future<VenueModel> updateVenue(VenueModel venue) => venuesApiProvider.updateVenue(venue);


}