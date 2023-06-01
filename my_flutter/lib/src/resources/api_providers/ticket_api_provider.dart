import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart';
import 'package:my_flutter/src/models/lists/tickets_list.dart';
import 'package:my_flutter/src/models/ticket_model.dart';

import '../../models/request_model.dart';
import '../util/ServerUrls.dart';

class TicketApiProvider {
  Client client = Client();

  Future<TicketModel> buyTicket(TicketModel ticket) async {
    print("entered");
    String apiUrl = '${ServerUrls.SERVER_URL}${ServerUrls.TICKET_BUY_URL}';
    final response = await client
        .post(Uri.parse(apiUrl),body: ticket);
    print(response.body.toString());
    if (response.statusCode == 200) {
      return TicketModel.fromJson(json.decode(response.body));
    } else {

      throw Exception('Failed to load Ticket');
    }
  }
  Future<TicketModel> mailTicket(TicketModel ticket) async {
    print("entered");
    String apiUrl = '${ServerUrls.SERVER_URL}${ServerUrls.TICKET_MAIL_URL}';
    final response = await client
        .post(Uri.parse(apiUrl),body: ticket);
    print(response.body.toString());
    if (response.statusCode == 200) {
      return TicketModel.fromJson(json.decode(response.body));
    } else {

      throw Exception('Failed to load Ticket');
    }
  }
  Future<TicketModel> exchangeTicket(RequestModel ticket) async {
    print("entered");
    String apiUrl = '${ServerUrls.SERVER_URL}${ServerUrls.TICKET_EXCHANGE_URL}';
    final response = await client
        .post(Uri.parse(apiUrl),body: ticket);
    print(response.body.toString());
    if (response.statusCode == 200) {
      return TicketModel.fromJson(json.decode(response.body));
    } else {

      throw Exception('Failed to load Ticket');
    }
  }

  Future<TicketsList> fetchTicketsByUserId(Long userId) async {
    print("entered");
    String apiUrl = '${ServerUrls.SERVER_URL}${ServerUrls.GET_TICKETS_BY_USER_ID_URL}$userId';
    final response = await client
        .get(Uri.parse(apiUrl));
    print(response.body.toString());
    if (response.statusCode == 200) {
      return TicketsList.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Tickets');
    }
  }

  Future<TicketModel> fetchTicket(Long id) async {
    print("entered");
    String apiUrl = '${ServerUrls.SERVER_URL}${ServerUrls.GET_TICKET_BY_ID_URL}$id';
    final response = await client
        .get(Uri.parse(apiUrl));
    print(response.body.toString());
    if (response.statusCode == 200) {
      return TicketModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Ticket');
    }
  }
  Future<TicketModel> addTicket(TicketModel ticket) async {
    print("entered");
    String apiUrl = '${ServerUrls.SERVER_URL}${ServerUrls.ADD_TICKET_URL}';
    final response = await client
        .post(Uri.parse(apiUrl),body: ticket);
    print(response.body.toString());
    if (response.statusCode == 200) {
      return TicketModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Ticket');
    }
  }
  Future<TicketModel> deleteTicket(Long id) async {
    print("entered");
    String apiUrl = '${ServerUrls.SERVER_URL}${ServerUrls.DELETE_TICKET_URL}$id';
    final response = await client
        .delete(Uri.parse(apiUrl));
    print(response.body.toString());
    if (response.statusCode == 200) {
      return TicketModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Ticket');
    }}
  Future<TicketModel> updateTicket(TicketModel ticket) async {
    print("entered");
    String apiUrl = '${ServerUrls.SERVER_URL}${ServerUrls.UPDATE_TICKET_URL}';
    final response = await client
        .post(Uri.parse(apiUrl),body: ticket);
    print(response.body.toString());
    if (response.statusCode == 200) {
      return TicketModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Ticket');
    }
  }
}