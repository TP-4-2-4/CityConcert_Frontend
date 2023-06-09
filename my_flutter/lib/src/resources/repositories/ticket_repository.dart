
import 'package:my_flutter/src/models/lists/tickets_list.dart';
import 'package:my_flutter/src/models/ticket_model.dart';

import '../../models/request_model.dart';
import '../api_providers/ticket_api_provider.dart';

class Repository {
  final ticketsApiProvider = TicketApiProvider();

  Future<TicketModel> buyTicket(TicketModel ticket) => ticketsApiProvider.buyTicket(ticket);
  Future<TicketModel> mailTicket(TicketModel ticket) => ticketsApiProvider.mailTicket(ticket);
  Future<TicketModel> exchangeTicket(RequestModel exchange) => ticketsApiProvider.exchangeTicket(exchange);
  Future<TicketsList> fetchTicketsByUserId(int userId) => ticketsApiProvider.fetchTicketsByUserId(userId);
  Future<TicketsList> fetchTicketsByEventId(int eventId) => ticketsApiProvider.fetchTicketsByEventId(eventId);
  Future<TicketModel> fetchTicket(int id) => ticketsApiProvider.fetchTicket(id);
  Future<TicketModel> deleteTicket(int id) => ticketsApiProvider.deleteTicket(id);
  Future<TicketModel> addTicket(TicketModel ticket) => ticketsApiProvider.addTicket(ticket);
  Future<TicketModel> updateTicket(TicketModel ticket) => ticketsApiProvider.updateTicket(ticket);


}