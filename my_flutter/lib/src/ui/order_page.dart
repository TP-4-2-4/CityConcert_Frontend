import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_flutter/src/models/event_model.dart';
import 'package:my_flutter/src/models/ticket_model.dart';
import 'package:my_flutter/src/models/lists/tickets_list.dart';
import 'package:my_flutter/src/ui/payment_page.dart';

import '../blocs/ticket_bloc.dart';
import 'custom_widgets/event_card.dart';

class OrderPage extends StatefulWidget {
  final EventModel event;

  const OrderPage({super.key, required this.event});

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  TicketModel? selectedTicket;

  Future<TicketsList> _getEventTickets(int eventId) async {
    return bloc.fetchTicketsByEventId(eventId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Купить билет',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image(
                      image: MemoryImage(base64Decode(widget.event.image!)),
                      width: 136,
                      height: 136,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 8, 0, 16),
                            child: Text(
                              widget.event.name!,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Theme.of(context).primaryColorLight,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Text(
                            widget.event.startTime!,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Theme.of(context).primaryColorLight,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                    child: Text(
                      'Выберете место',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Theme.of(context).primaryColorLight,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                    child: Row(mainAxisSize: MainAxisSize.max, children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                                backgroundColor: Theme.of(context).canvasColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 300.0,
                                        child: FutureBuilder<TicketsList>(
                                          future: _getEventTickets(
                                              widget.event.id!),
                                          builder: (context,
                                              AsyncSnapshot<TicketsList>
                                                  snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.done) {
                                              if (snapshot.hasData) {
                                                return ListView(
                                                    children: List.generate(
                                                        snapshot.data!.tickets
                                                            .length,
                                                        (index) => TextButton(
                                                            onPressed: () {
                                                              setState(() {
                                                                selectedTicket =
                                                                snapshot.data!
                                                                    .tickets[
                                                                index];
                                                              });
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Text(snapshot
                                                                .data!
                                                                .tickets[index]
                                                                .seat!))));
                                              } else if (snapshot.hasError) {
                                                return Text(
                                                    snapshot.error.toString());
                                              } else {
                                                return const Center(
                                                    child: Text(
                                                        'На это мероприятие нет билетов'));
                                              }
                                            } else if (snapshot
                                                    .connectionState ==
                                                ConnectionState.waiting) {
                                              return const Text(
                                                "Заугрузка...",
                                              );
                                            } else {
                                              return Center(
                                                  child: Text(
                                                      'State: ${snapshot.connectionState}'));
                                            }
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          style: flatroundedButtonStyle,
                          child: const Text(
                            'Выбрать билет',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
            Padding(padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
              child: Text(
                  selectedTicket!=null ? 'Ваше место: ${selectedTicket!.seat} стоимость ${selectedTicket!.price}' : 'Место пока не выбрано',
                style: TextStyle(
                  color: Theme.of(context).primaryColorLight,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        selectedTicket!=null ?
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PaymentPage(ticket: selectedTicket!))) : ();
                      },
                      style: flatroundedButtonStyle,
                      child: const Text('Перейти к оплате'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
