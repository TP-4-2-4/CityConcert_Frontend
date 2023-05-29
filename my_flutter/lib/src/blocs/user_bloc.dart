
import 'dart:ffi';

import 'package:my_flutter/src/models/registration_model.dart';
import 'package:rxdart/rxdart.dart';

import '../models/user_model.dart';
import '../resources/repositories/user_repository.dart';

class UserBloc {
  final _repository = Repository();

  final _userFetcher = PublishSubject<UserModel>();
  final _regFetcher = PublishSubject<RegistrationModel>();

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
  registration(RegistrationModel user) async {
    RegistrationModel r = await _repository.registration(user);
    _regFetcher.sink.add(r);
  }
  login(String username, String password) async {
    UserModel user = await _repository.login(username,password);
    _userFetcher.sink.add(user);
  }
  dispose() {
    _userFetcher.close();
  }
}

final bloc = UserBloc();