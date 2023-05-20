import 'dart:ffi';

import 'package:rxdart/rxdart.dart';

import '../models/lists/requests_list.dart';
import '../models/request_model.dart';
import '../resources/repositories/request_repository.dart';

class RequestBloc {
  final _repository = Repository();
  final _requestFetcher = PublishSubject<RequestModel>();
  final _requestsFetcher = PublishSubject<RequestsList>();

  Stream<RequestModel> get requests => _requestFetcher.stream;

  fetchRequests(String type) async {
    RequestsList itemModel = await _repository.fetchRequests(type);
    _requestsFetcher.sink.add(itemModel);
  }
  fetchRequestById(Long id) async {
    RequestModel request = await _repository.fetchRequest(id);
    _requestFetcher.sink.add(request);
  }
  addRequest(RequestModel request) async {
    RequestModel e = await _repository.addRequest(request);
    _requestFetcher.sink.add(e);
  }
  deleteRequestById(Long id) async {
    RequestModel request = await _repository.deleteRequest(id);
    _requestFetcher.sink.add(request);
  }
  updateRequest(RequestModel request) async {
    RequestModel e = await _repository.updateRequest(request);
    _requestFetcher.sink.add(e);
  }
  dispose() {
    _requestsFetcher.close();
    _requestFetcher.close();
  }
}

final bloc = RequestBloc();