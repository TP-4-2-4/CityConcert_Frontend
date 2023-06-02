

import 'package:my_flutter/src/models/registration_model.dart';
import 'package:rxdart/rxdart.dart';

import '../models/user_model.dart';
import '../resources/repositories/user_repository.dart';

class UserBloc {
  final _repository = UserRepository();
  final _userFetcher = PublishSubject<UserModel>();
  final _regFetcher = PublishSubject<RegistrationModel>();

  UserModel currentUser = UserModel.empty();

  Stream<UserModel> get user => _userFetcher.stream;
  fetchCurrentUser() async {
    UserModel user = await _repository.fetchCurrentUser();
    _userFetcher.sink.add(user);
  }
  fetchUserById(int id) async {
    UserModel user = await _repository.fetchUser(id);
    _userFetcher.sink.add(user);
  }
  addUser(UserModel user) async {
    UserModel u = await _repository.addUser(user);
    _userFetcher.sink.add(u);
  }
  deleteUserById(int id) async {
    UserModel user = await _repository.deleteUser(id);
    _userFetcher.sink.add(user);
  }
  updateUser(UserModel user) async {
    UserModel u = await _repository.updateUser(user);
    _userFetcher.sink.add(u);
  }
  registration(RegistrationModel user) async {
    RegistrationModel r = await _repository.registration(user);
    _regFetcher.sink.add(r);
  }
  Future<UserModel> login(String username, String password) async {
    UserModel user = await _repository.login(username,password);
    currentUser =  user;
    _userFetcher.sink.add(user);
    return user;
  }


  dispose() {
    _userFetcher.close();
  }
}

final bloc = UserBloc();