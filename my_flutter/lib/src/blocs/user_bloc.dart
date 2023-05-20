
import 'dart:ffi';

import 'package:rxdart/rxdart.dart';

import '../models/user_model.dart';
import '../resources/repositories/user_repository.dart';

class UserBloc {
  final _repository = Repository();

  final _userFetcher = PublishSubject<UserModel>();

  Stream<UserModel> get user => _userFetcher.stream;
  fetchUsers() async {
    UserModel itemModel = await _repository.fetchCurrentUser();
    _userFetcher.sink.add(itemModel);
  }
  fetchUserById(Long id) async {
    UserModel user = await _repository.fetchUser(id);
    _userFetcher.sink.add(user);
  }
  addUser(UserModel user) async {
    UserModel e = await _repository.addUser(user);
    _userFetcher.sink.add(e);
  }
  deleteUserById(Long id) async {
    UserModel user = await _repository.deleteUser(id);
    _userFetcher.sink.add(user);
  }
  updateUser(UserModel user) async {
    UserModel e = await _repository.updateUser(user);
    _userFetcher.sink.add(e);
  }

  dispose() {
    _userFetcher.close();
  }
}

final bloc = UserBloc();