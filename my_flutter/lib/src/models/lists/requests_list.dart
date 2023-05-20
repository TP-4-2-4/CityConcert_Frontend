import 'package:my_flutter/src/models/request_model.dart';

class RequestsList {
  late final List<RequestModel> requests;


  RequestsList.fromJson(List<dynamic> json) {
    requests = json.map((i)=>RequestModel.fromJson(i as Map<String, dynamic>)).toList();
  }
  RequestsList(
      {
        required this.requests
      }
      );
}
