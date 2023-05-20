import 'dart:async';
import 'dart:ffi';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../../models/lists/venues_list.dart';
import '../../models/venue_model.dart';
import '../util/ServerUrls.dart';

class VenueApiProvider {
  Client client = Client();

  Future<VenuesList> fetchVenueList() async {
    print("entered");
    String apiUrl = '${ServerUrls.SERVER_URL}${ServerUrls.GET_VENUES_URL}';
    final response = await client
        .get(Uri.parse(apiUrl));
    print(response.body.toString());
    if (response.statusCode == 200) {
      return VenuesList.fromJson(json.decode(response.body));
    } else {

      throw Exception('Failed to load venue');
    }
  }

  Future<VenueModel> fetchVenue(Long id) async {
    print("entered");
    String apiUrl = '${ServerUrls.SERVER_URL}${ServerUrls.GET_VENUE_BY_ID_URL}$id';
    final response = await client
        .get(Uri.parse(apiUrl));
    print(response.body.toString());
    if (response.statusCode == 200) {
      return VenueModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load venue');
    }
  }
  Future<VenueModel> addVenue(VenueModel Venue) async {
    print("entered");
    String apiUrl = '${ServerUrls.SERVER_URL}${ServerUrls.ADD_VENUE_URL}';
    final response = await client
        .post(Uri.parse(apiUrl),body: Venue);
    print(response.body.toString());
    if (response.statusCode == 200) {
      return VenueModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load venue');
    }
  }
  Future<VenueModel> deleteVenue(Long id) async {
    print("entered");
    String apiUrl = '${ServerUrls.SERVER_URL}${ServerUrls.DELETE_VENUE_URL}$id';
    final response = await client
        .delete(Uri.parse(apiUrl));
    print(response.body.toString());
    if (response.statusCode == 200) {
      return VenueModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load venue');
    }}
  Future<VenueModel> updateVenue(VenueModel venue) async {
    print("entered");
    String apiUrl = '${ServerUrls.SERVER_URL}${ServerUrls.UPDATE_VENUE_URL}';
    final response = await client
        .post(Uri.parse(apiUrl),body: venue);
    print(response.body.toString());
    if (response.statusCode == 200) {
      return VenueModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load venue');
    }
  }
}