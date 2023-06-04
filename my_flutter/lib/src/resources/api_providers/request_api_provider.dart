import 'dart:convert';

import 'package:http/http.dart';

import '../../models/lists/requests_list.dart';
import '../../models/request_model.dart';
import '../util/ServerUrls.dart';

class RequestApiProvider {
  Client client = Client();

  Future<RequestsList> fetchRequestList(String type) async {
    print("entered");
    String apiUrl =
        '${ServerUrls.SERVER_URL}${ServerUrls.GET_REQUESTS_BY_TYPE_URL}/$type';
    Map<String, String> headers = {
      'content-type': 'application/json; charset=utf-8',
      'Accept': "*/*"
    };
    final response = await client.get(Uri.parse(apiUrl), headers: headers);

    print(response.body.toString());
    if (response.statusCode == 200) {
      return RequestsList.fromJson(
          json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception('Failed to load Request');
    }
  }

  Future<RequestModel> fetchRequest(int id) async {
    print("entered");
    String apiUrl =
        '${ServerUrls.SERVER_URL}${ServerUrls.GET_REQUEST_BY_ID_URL}$id';
    Map<String, String> headers = {
      'content-type': 'application/json; charset=utf-8',
      'Accept': "*/*"
    };
    final response = await client.get(Uri.parse(apiUrl), headers: headers);

    print(response.body.toString());
    if (response.statusCode == 200) {
      return RequestModel.fromJson(
          json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception('Failed to load Request');
    }
  }

  Future<RequestModel> addRequest(RequestModel request) async {
    print("entered");
    String apiUrl = '${ServerUrls.SERVER_URL}${ServerUrls.ADD_REQUEST_URL}';
    Map<String, String> headers = {
      'Content-Type': 'application/json', //todo: fix
      'Accept': "*/*"
    };
    final response =
        await client.post(Uri.parse(apiUrl), body: request.toJson(), headers: headers);
    print(response.body.toString());
    if (response.statusCode == 200) {
      return RequestModel.fromJson(
          json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception('Failed to load Request');
    }
  }

  Future<RequestModel> deleteRequest(int id) async {
    print("entered");
    String apiUrl =
        '${ServerUrls.SERVER_URL}${ServerUrls.DELETE_REQUEST_URL}$id';
    Map<String, String> headers = {
      'content-type': 'application/json; charset=utf-8',
      'Accept': "*/*"
    };
    final response = await client.delete(Uri.parse(apiUrl), headers: headers);

    print(response.body.toString());
    if (response.statusCode == 200) {
      return RequestModel.fromJson(
          json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception('Failed to load Request');
    }
  }

  Future<RequestModel> updateRequest(RequestModel request) async {
    print("entered");
    String apiUrl = '${ServerUrls.SERVER_URL}${ServerUrls.UPDATE_REQUEST_URL}';
    Map<String, String> headers = {
      'content-type': 'application/json; charset=utf-8',
      'Accept': "*/*"
    };
    final response =
        await client.post(Uri.parse(apiUrl), body: request, headers: headers);
    print(response.body.toString());
    if (response.statusCode == 200) {
      return RequestModel.fromJson(
          json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception('Failed to load Request');
    }
  }
}
