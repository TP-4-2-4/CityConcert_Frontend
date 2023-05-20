import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart';

import '../../models/user_model.dart';
import '../util/ServerUrls.dart';

class UserApiProvider {
  Client client = Client();

  Future<UserModel> fetchCurrentUser() async {
    print("entered");
    String apiUrl = '${ServerUrls.SERVER_URL}${ServerUrls.GET_USER_CURRENT_URL}';
    final response = await client
        .get(Uri.parse(apiUrl));
    print(response.body.toString());
    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    } else {

      throw Exception('Failed to load User');
    }
  }

  Future<UserModel> fetchUser(Long id) async {
    print("entered");
    String apiUrl = '${ServerUrls.SERVER_URL}${ServerUrls.GET_USER_BY_ID_URL}$id';
    final response = await client
        .get(Uri.parse(apiUrl));
    print(response.body.toString());
    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load User');
    }
  }
  Future<UserModel> addUser(UserModel user) async {
    print("entered");
    String apiUrl = '${ServerUrls.SERVER_URL}${ServerUrls.ADD_USER_URL}';
    final response = await client
        .post(Uri.parse(apiUrl),body: user);
    print(response.body.toString());
    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load User');
    }
  }
  Future<UserModel> deleteUser(Long id) async {
    print("entered");
    String apiUrl = '${ServerUrls.SERVER_URL}${ServerUrls.DELETE_USER_URL}$id';
    final response = await client
        .delete(Uri.parse(apiUrl));
    print(response.body.toString());
    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load User');
    }}
  Future<UserModel> updateUser(UserModel user) async {
    print("entered");
    String apiUrl = '${ServerUrls.SERVER_URL}${ServerUrls.UPDATE_USER_URL}';
    final response = await client
        .post(Uri.parse(apiUrl),body: user);
    print(response.body.toString());
    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load User');
    }
  }
}