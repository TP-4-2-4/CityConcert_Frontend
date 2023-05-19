import 'dart:ffi';

import 'package:my_flutter/src/models/ticket_model.dart';

import '../api_providers/ticket_api_provider.dart';

class Repository {
  final ticketsApiProvider = TicketApiProvider();

  Future<TicketModel> buyTicket(TicketModel ticket) => ticketsApiProvider.buyTicket(ticket);
  Future<TicketModel> mailTicket(TicketModel ticket) => ticketsApiProvider.mailTicket(ticket);
  Future<TicketModel> exchangeTicket(TicketModel ticket) => ticketsApiProvider.exchangeTicket(ticket);
  Future<TicketModel> fetchTicket(Long id) => ticketsApiProvider.fetchTicket(id);
  Future<TicketModel> deleteTicket(Long id) => ticketsApiProvider.deleteTicket(id);
  Future<TicketModel> addTicket(TicketModel ticket) => ticketsApiProvider.addTicket(ticket);
  Future<TicketModel> updateTicket(TicketModel ticket) => ticketsApiProvider.updateTicket(ticket);


}