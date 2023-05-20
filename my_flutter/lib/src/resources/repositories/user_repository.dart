import 'dart:ffi';

import 'package:my_flutter/src/models/user_model.dart';

import '../api_providers/user_api_provider.dart';

class Repository {
  final usersApiProvider = UserApiProvider();

  Future<UserModel> fetchCurrentUser() => usersApiProvider.fetchCurrentUser();
  Future<UserModel> fetchUser(Long id) => usersApiProvider.fetchUser(id);
  Future<UserModel> deleteUser(Long id) => usersApiProvider.deleteUser(id);
  Future<UserModel> addUser(UserModel user) => usersApiProvider.addUser(user);
  Future<UserModel> updateUser(UserModel user) => usersApiProvider.updateUser(user);


}
