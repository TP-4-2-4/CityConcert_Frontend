import 'dart:ffi';

import 'package:rxdart/rxdart.dart';

import '../models/ticket_model.dart';
import '../resources/repositories/ticket_repository.dart';

class TicketBloc {
  final _repository = Repository();
  final _ticketFetcher = PublishSubject<TicketModel>();

  Stream<TicketModel> get ticket => _ticketFetcher.stream;

  buyTicket(TicketModel ticket) async {
    TicketModel t = await _repository.buyTicket(ticket);
    _ticketFetcher.sink.add(t);
  }

  mailTicket(TicketModel ticket) async {
    TicketModel t = await _repository.mailTicket(ticket);
    _ticketFetcher.sink.add(t);
  }

  exchangeTicket(TicketModel ticket) async {
    TicketModel t = await _repository.exchangeTicket(ticket);
    _ticketFetcher.sink.add(t);
  }

  fetchTicketById(Long id) async {
    TicketModel ticket = await _repository.fetchTicket(id);
    _ticketFetcher.sink.add(ticket);
  }

  addTicket(TicketModel ticket) async {
    TicketModel e = await _repository.addTicket(ticket);
    _ticketFetcher.sink.add(e);
  }

  deleteTicketById(Long id) async {
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
