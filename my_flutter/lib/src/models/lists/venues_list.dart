import 'package:my_flutter/src/models/venue_model.dart';

class VenuesList {
  late final List<VenueModel> venues;


  VenuesList.fromJson(List<dynamic> json) {
    venues = json.map((i)=>VenueModel.fromJson(i as Map<String, dynamic>)).toList();
  }
 VenuesList(
      {
        required this.venues
      }
      );
}
