import 'package:my_flutter/src/models/user_model.dart';

class UsersList {
  late final List<UserModel> users;


  UsersList.fromJson(List<dynamic> json) {
    users = json.map((i)=>UserModel.fromJson(i as Map<String, dynamic>)).toList();
  }
  UsersList(
      {
        required this.users
      }
      );
}
