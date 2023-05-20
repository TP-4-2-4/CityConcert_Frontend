import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart';

import '../../models/lists/requests_list.dart';
import '../../models/request_model.dart';
import '../util/ServerUrls.dart';

class RequestApiProvider {
  Client client = Client();

  Future<RequestsList> fetchRequestList(String type) async {
    print("entered");
    String apiUrl = '${ServerUrls.SERVER_URL}${ServerUrls.GET_REQUESTS_BY_TYPE_URL}/$type';
    final response = await client
        .get(Uri.parse(apiUrl));
    print(response.body.toString());
    if (response.statusCode == 200) {
      return RequestsList.fromJson(json.decode(response.body));
    } else {

      throw Exception('Failed to load Request');
    }
  }

  Future<RequestModel> fetchRequest(Long id) async {
    print("entered");
    String apiUrl = '${ServerUrls.SERVER_URL}${ServerUrls.GET_REQUEST_BY_ID_URL}$id';
    final response = await client
        .get(Uri.parse(apiUrl));
    print(response.body.toString());
    if (response.statusCode == 200) {
      return RequestModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Request');
    }
  }
  Future<RequestModel> addRequest(RequestModel request) async {
    print("entered");
    String apiUrl = '${ServerUrls.SERVER_URL}${ServerUrls.ADD_REQUEST_URL}';
    final response = await client
        .post(Uri.parse(apiUrl),body: request);
    print(response.body.toString());
    if (response.statusCode == 200) {
      return RequestModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Request');
    }
  }
  Future<RequestModel> deleteRequest(Long id) async {
    print("entered");
    String apiUrl = '${ServerUrls.SERVER_URL}${ServerUrls.DELETE_REQUEST_URL}$id';
    final response = await client
        .delete(Uri.parse(apiUrl));
    print(response.body.toString());
    if (response.statusCode == 200) {
      return RequestModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Request');
    }}
  Future<RequestModel> updateRequest(RequestModel request) async {
    print("entered");
    String apiUrl = '${ServerUrls.SERVER_URL}${ServerUrls.UPDATE_REQUEST_URL}';
    final response = await client
        .post(Uri.parse(apiUrl),body: request);
    print(response.body.toString());
    if (response.statusCode == 200) {
      return RequestModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Request');
    }
  }
}