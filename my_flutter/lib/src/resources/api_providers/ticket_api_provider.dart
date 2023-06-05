import 'dart:convert';

import 'package:http/http.dart';
import 'package:my_flutter/src/models/lists/tickets_list.dart';
import 'package:my_flutter/src/models/ticket_model.dart';

import '../../models/request_model.dart';
import '../util/ServerUrls.dart';

class TicketApiProvider {
  Client client = Client();

  Future<TicketModel> buyTicket(TicketModel ticket) async {
    print("entered");
    String apiUrl = '${ServerUrls.SERVER_URL}${ServerUrls.TICKET_BUY_URL}${ticket.id}';
    Map<String, String> headers = {
      'content-type': 'application/json; charset=utf-8',
      'Accept': "*/*"
    };
    final response = await client.put(Uri.parse(apiUrl), body: json.encode(ticket.toJson()), headers: headers);
    print(response.body.toString());
    if (response.statusCode == 200) {
      return TicketModel.fromJson(json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception('Failed to load Ticket');
    }
  }

  Future<TicketModel> mailTicket(TicketModel ticket) async {
    print("entered");
    String apiUrl = '${ServerUrls.SERVER_URL}${ServerUrls.TICKET_MAIL_URL}';
    Map<String, String> headers = {
      'content-type': 'application/json; charset=utf-8',
      'Accept': "*/*"
    };
    final response = await client.post(Uri.parse(apiUrl), body: ticket, headers: headers);
    print(response.body.toString());
    if (response.statusCode == 200) {
      return TicketModel.fromJson(json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception('Failed to load Ticket');
    }
  }

  Future<TicketModel> exchangeTicket(RequestModel exchange) async {
    print("entered");
    String apiUrl = '${ServerUrls.SERVER_URL}${ServerUrls.TICKET_EXCHANGE_URL}';
    Map<String, String> headers = {
      'content-type': 'application/json; charset=utf-8',
      'Accept': "*/*"
    };
    final response = await client.post(Uri.parse(apiUrl), body: json.encode(exchange.toJson()), headers: headers);
    print(response.body.toString());
    if (response.statusCode == 200) {
      return TicketModel.fromJson(json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception('Failed to load Ticket');
    }
  }

  Future<TicketsList> fetchTicketsByUserId(int userId) async {
    print("entered");
    String apiUrl =
        '${ServerUrls.SERVER_URL}${ServerUrls.GET_TICKETS_BY_USER_ID_URL}$userId';
    Map<String, String> headers = {
      'content-type': 'application/json; charset=utf-8',
      'Accept': "*/*"
    };
    final response = await client.get(Uri.parse(apiUrl), headers: headers);
    print(response.body.toString());
    if (response.statusCode == 200) {
      return TicketsList.fromJson(json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception('Failed to load Tickets');
    }
  }

  Future<TicketsList> fetchTicketsByEventId(int eventId) async {
    print("entered");
    String apiUrl =
        '${ServerUrls.SERVER_URL}${ServerUrls.GET_TICKETS_BY_EVENT_ID_URL}$eventId';
    Map<String, String> headers = {
      'content-type': 'application/json; charset=utf-8',
      'Accept': "*/*"
    };
    final response = await client.get(Uri.parse(apiUrl), headers: headers);
    print(response.body.toString());
    if (response.statusCode == 200) {
      return TicketsList.fromJson(json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception('Failed to load Tickets by EventID');
    }
  }

  Future<TicketModel> fetchTicket(int id) async {
    print("entered");
    String apiUrl =
        '${ServerUrls.SERVER_URL}${ServerUrls.GET_TICKET_BY_ID_URL}$id';
    Map<String, String> headers = {
      'content-type': 'application/json; charset=utf-8',
      'Accept': "*/*"
    };
    final response = await client.get(Uri.parse(apiUrl), headers: headers);
    print(response.body.toString());
    if (response.statusCode == 200) {
      return TicketModel.fromJson(json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception('Failed to load Ticket');
    }
  }

  Future<TicketModel> addTicket(TicketModel ticket) async {
    print("entered");
    String apiUrl = '${ServerUrls.SERVER_URL}${ServerUrls.ADD_TICKET_URL}';
    Map<String, String> headers = {
      'content-type': 'application/json; charset=utf-8',
      'Accept': "*/*"
    };
    final response = await client.post(Uri.parse(apiUrl), body: ticket, headers: headers);
    print(response.body.toString());
    if (response.statusCode == 200) {
      return TicketModel.fromJson(json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception('Failed to load Ticket');
    }
  }

  Future<TicketModel> deleteTicket(int id) async {
    print("entered");
    String apiUrl =
        '${ServerUrls.SERVER_URL}${ServerUrls.DELETE_TICKET_URL}$id';
    Map<String, String> headers = {
      'content-type': 'application/json; charset=utf-8',
      'Accept': "*/*"
    };
    final response = await client.delete(Uri.parse(apiUrl), headers: headers);
    print(response.body.toString());
    if (response.statusCode == 200) {
      return TicketModel.fromJson(json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception('Failed to load Ticket');
    }
  }

  Future<TicketModel> updateTicket(TicketModel ticket) async {
    print("entered");
    String apiUrl = '${ServerUrls.SERVER_URL}${ServerUrls.UPDATE_TICKET_URL}';
    Map<String, String> headers = {
      'content-type': 'application/json; charset=utf-8',
      'Accept': "*/*"
    };
    final response = await client.post(Uri.parse(apiUrl), body: ticket, headers: headers);
    print(response.body.toString());
    if (response.statusCode == 200) {
      return TicketModel.fromJson(json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception('Failed to load Ticket');
    }
  }
}
