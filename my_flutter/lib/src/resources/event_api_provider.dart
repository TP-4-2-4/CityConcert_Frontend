import 'dart:async';
import 'package:http/http.dart' show Client;
import 'package:my_flutter/src/models/lists/events_list.dart';
import 'dart:convert';
import 'util/ServerUrls.dart';

class MovieApiProvider {
  Client client = Client();

  Future<EventsList> fetchEventList(String searchText) async {
    print("entered");
    String apiUrl = '${ServerUrls.SERVER_URL}${ServerUrls.ADD_EVENT_URL}/$searchText';
    final response = await client
        .get(Uri.parse(apiUrl));
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return EventsList.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}