import 'dart:async';
import 'package:http/http.dart' show Client;
import 'package:my_flutter/src/models/event_model.dart';
import 'package:my_flutter/src/models/lists/events_list.dart';
import 'dart:convert';
import '../util/ServerUrls.dart';

class EventApiProvider {
  Client client = Client();

  Future<EventsList> fetchEventListByName(String searchText) async {
    print("entered");
    String apiUrl = '${ServerUrls.SERVER_URL}${ServerUrls.FILTER_BY_NAME_EVENT_URL}/$searchText';
    final response = await client
        .get(Uri.parse(apiUrl));
    print(response.body.toString());
    if (response.statusCode == 200) {
      return EventsList.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load event');
    }
  }

  Future<EventsList> fetchEventListByFilter() async {
    print("entered");
    String apiUrl = '${ServerUrls.SERVER_URL}${ServerUrls.FILTER_EVENT_URL}';
    final response = await client
        .post(Uri.parse(apiUrl));
    print(response.body.toString());
    if (response.statusCode == 200) {
      return EventsList.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load event');
    }
  }
  Future<EventsList> fetchEventListAll() async {
    print("entered");
    String apiUrl = '${ServerUrls.SERVER_URL}${ServerUrls.GET_EVENTS_URL}';
    final response = await client
        .get(Uri.parse(apiUrl));
    print(response.body.toString());
    if (response.statusCode == 200) {
      return EventsList.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load event');
    }
  }
  Future<EventModel> fetchEvent(int id) async {
    print("entered");
    String apiUrl = '${ServerUrls.SERVER_URL}${ServerUrls.GET_EVENT_BY_ID_URL}$id';
    final response = await client
        .get(Uri.parse(apiUrl));
    print(response.body.toString());
    if (response.statusCode == 200) {
      return EventModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load event');
    }
  }
  Future<EventModel> addEvent(EventModel event) async {
    print("entered");
    String apiUrl = '${ServerUrls.SERVER_URL}${ServerUrls.ADD_EVENT_URL}';
    Map<String,String> headers = {'content-type':'application/json','Accept':"*/*"};
    final response = await client
        .post(Uri.parse(apiUrl),body: json.encode(event.toJson()),headers: headers);
    print(response.body.toString());
    print(response.statusCode);
    if (response.statusCode == 200) {
      return EventModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load event');
    }
  }
  Future<void> deleteEvent(int id) async {
    print("entered");
    String apiUrl = '${ServerUrls.SERVER_URL}${ServerUrls.DELETE_EVENT_URL}$id';
    final response = await client
        .delete(Uri.parse(apiUrl));
    print(response.body.toString());
    if (response.statusCode != 200) {
      throw Exception('Failed to load event');
    } }


  Future<EventModel> updateEvent(EventModel event) async {
    print("entered");
    String apiUrl = '${ServerUrls.SERVER_URL}${ServerUrls.UPDATE_EVENT_URL}';
    Map<String,String> headers = {'content-type':'application/json','Accept':"*/*"};
    final response = await client
        .post(Uri.parse(apiUrl),body: json.encode(event.toJson()),headers: headers);
    print(response.body.toString());
    if (response.statusCode == 200) {
      return EventModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load event');
    }
  }

  Future<EventsList> fetchEventsByRecommendations() async {
    print("entered");
    String apiUrl = '${ServerUrls.SERVER_URL}${ServerUrls.RECOMMENDATIONS_EVENT_URL}';
    final response = await client
        .get(Uri.parse(apiUrl));
    print(response.statusCode);
    if (response.statusCode == 200) {
      return EventsList.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load event');
    }
  }

}