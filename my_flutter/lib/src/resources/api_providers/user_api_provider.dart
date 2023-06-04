import 'dart:convert';

import 'package:http/http.dart';
import 'package:my_flutter/src/models/registration_model.dart';

import '../../models/user_model.dart';
import '../util/ServerUrls.dart';

class UserApiProvider {
  Client client = Client();

  Future<UserModel> fetchCurrentUser() async {
    print("entered");
    String apiUrl =
        '${ServerUrls.SERVER_URL}${ServerUrls.GET_USER_CURRENT_URL}';
    final response = await client.get(Uri.parse(apiUrl));
    print(response.body.toString());
    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception('Failed to load User');
    }
  }

  Future<UserModel> fetchUser(int id) async {
    print("entered");
    String apiUrl =
        '${ServerUrls.SERVER_URL}${ServerUrls.GET_USER_BY_ID_URL}$id';
    final response = await client.get(Uri.parse(apiUrl));
    print(response.body.toString());
    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception('Failed to load User');
    }
  }

  Future<UserModel> addUser(UserModel user) async {
    print("entered");
    String apiUrl = '${ServerUrls.SERVER_URL}${ServerUrls.ADD_USER_URL}';
    final response = await client.post(Uri.parse(apiUrl), body: user);
    print(response.body.toString());
    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception('Failed to load User');
    }
  }

  Future<UserModel> deleteUser(int id) async {
    print("entered");
    String apiUrl = '${ServerUrls.SERVER_URL}${ServerUrls.DELETE_USER_URL}$id';
    final response = await client.delete(Uri.parse(apiUrl));
    print(response.body.toString());
    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception('Failed to load User');
    }
  }

  Future<UserModel> updateUser(UserModel user) async {
    print("entered");
    String apiUrl = '${ServerUrls.SERVER_URL}${ServerUrls.UPDATE_USER_URL}';
    final response = await client.post(Uri.parse(apiUrl), body: user);
    print(response.body.toString());
    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception('Failed to load User');
    }
  }

  Future<RegistrationModel> registration(RegistrationModel user) async {
    print("entered");
    String apiUrl = '${ServerUrls.SERVER_URL}${ServerUrls.REGISTRATION_URL}';
    Map<String, String> headers = {
      'content-type': 'application/json',
      'Accept': "*/*"
    };
    final response = await client.post(Uri.parse(apiUrl),
        body: json.encode(user.toJson()), headers: headers);
    print(response.body.toString());
    if (response.statusCode == 200) {
      return RegistrationModel.fromJson(
          json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception('Failed to load User');
    }
  }

  Future<UserModel> login(String username, String password) async {
    print("entered");
    String apiUrl = '${ServerUrls.SERVER_URL}${ServerUrls.LOGIN_URL}'
        '?username=$username&password=$password';
    Map<String, String> headers = {
      'content-type': 'application/json',
      'Accept': "*/*"
    };
    final response = await client.get(Uri.parse(apiUrl), headers: headers);
    print(response.body.toString());
    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception('Failed to load User');
    }
  }

  logout() async {
    print("entered");
    String apiUrl = '${ServerUrls.SERVER_URL}${ServerUrls.LOGIN_URL}';
    final response = await client.get(Uri.parse(apiUrl));
    print(response.body.toString());
    if (response.statusCode == 200) {
      throw Exception('Failed to load User');
    }
  }
}
