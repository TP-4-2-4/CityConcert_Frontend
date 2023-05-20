import 'dart:ffi';

import '../../models/lists/requests_list.dart';
import '../../models/request_model.dart';
import '../api_providers/request_api_provider.dart';

class Repository {
  final requestsApiProvider = RequestApiProvider();

  Future<RequestsList> fetchRequests(String type) => requestsApiProvider.fetchRequestList(type);
  Future<RequestModel> fetchRequest(Long id) => requestsApiProvider.fetchRequest(id);
  Future<RequestModel> deleteRequest(Long id) => requestsApiProvider.deleteRequest(id);
  Future<RequestModel> addRequest(RequestModel request) => requestsApiProvider.addRequest(request);
  Future<RequestModel> updateRequest(RequestModel request) => requestsApiProvider.updateRequest(request);


}