import '../ticket_model.dart';

class TicketsList {
  late final List<TicketModel> tickets;

  TicketsList.fromJson(List<dynamic> json) {
    tickets = json
        .map((i) => TicketModel.fromJson(i as Map<String, dynamic>))
        .toList();
  }

  TicketsList({required this.tickets});
}
