
import 'package:my_flutter/src/models/lists/tickets_list.dart';
import 'package:my_flutter/src/models/request_model.dart';
import 'package:rxdart/rxdart.dart';

import '../models/ticket_model.dart';
import '../resources/repositories/ticket_repository.dart';

class TicketBloc {
  final _repository = Repository();
  final _ticketFetcher = PublishSubject<TicketModel>();
  final _ticketsFetcher = PublishSubject<TicketsList>();

  Stream<TicketModel> get ticket => _ticketFetcher.stream;
  Stream<TicketsList> get tickets => _ticketsFetcher.stream;

  buyTicket(TicketModel ticket) async {
    TicketModel t = await _repository.buyTicket(ticket);
    _ticketFetcher.sink.add(t);
  }

  mailTicket(TicketModel ticket) async {
    TicketModel t = await _repository.mailTicket(ticket);
    _ticketFetcher.sink.add(t);
  }

  exchangeTicket(RequestModel request) async {
    TicketModel t = await _repository.exchangeTicket(request);
    _ticketFetcher.sink.add(t);
  }

  fetchTicketsByUserId(int userId) async {
    TicketsList tickets = await _repository.fetchTicketsByUserId(userId);
    _ticketsFetcher.sink.add(tickets);
  }

  Future<TicketsList> fetchTicketsByEventId(int eventId) async {
    TicketsList tickets = await _repository.fetchTicketsByEventId(eventId);
    _ticketsFetcher.sink.add(tickets);
    return tickets;
  }

  fetchTicketById(int id) async {
    TicketModel ticket = await _repository.fetchTicket(id);
    _ticketFetcher.sink.add(ticket);
  }

  addTicket(TicketModel ticket) async {
    TicketModel e = await _repository.addTicket(ticket);
    _ticketFetcher.sink.add(e);
  }

  deleteTicketById(int id) async {
    TicketModel ticket = await _repository.deleteTicket(id);
    _ticketFetcher.sink.add(ticket);
  }

  updateTicket(TicketModel ticket) async {
    TicketModel e = await _repository.updateTicket(ticket);
    _ticketFetcher.sink.add(e);
  }

  dispose() {
    _ticketFetcher.close();
  }
}

final bloc = TicketBloc();
