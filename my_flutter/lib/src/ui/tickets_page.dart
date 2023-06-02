import 'package:flutter/material.dart';
import 'package:my_flutter/src/models/ticket_model.dart';

import 'custom_widgets/ticket_card.dart';

class TicketsWidget extends StatefulWidget {
  const TicketsWidget({Key? key}) : super(key: key);

  @override
  _TicketsWidgetState createState() => _TicketsWidgetState();
}

class _TicketsWidgetState extends State<TicketsWidget> {
  TicketModel ticketPlaceholder = TicketModel(id: 0, price: 0, seat: '0',
      status: '0', purchaseDate: '0', userId: 0, eventId: 0);
  @override
  void initState() {
    super.initState();
    //todo: fetch user tickets
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
              child: TicketCardWidget(ticket: ticketPlaceholder,),
            ),
          ],
        ),
      ),

    );
  }
}