import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:my_flutter/src/models/lists/tickets_list.dart';
import '../../blocs/ticket_bloc.dart';
import '../../blocs/user_bloc.dart' as ubloc;
import '../../models/request_model.dart';
import '../../models/user_model.dart';
import '../custom_widgets/event_card.dart';

class ExchangePage extends StatefulWidget {
  final RequestModel exchange;

  const ExchangePage({Key? key, required this.exchange}) : super(key: key);

  @override
  _ExchangePageState createState() => _ExchangePageState();
}

class _ExchangePageState extends State<ExchangePage> {
  late String _dropdownValue = "Выберете билет";
  late Long userId;

  void dropdownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _dropdownValue = selectedValue;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getCurrentUserTickets();
    _getCurrentUserId();
  }

  Future<void> _getCurrentUserTickets() async {
    bloc.fetchTicketsByUserId(userId);
  }

  Future<void> _getCurrentUserId() async {
    ubloc.fetchCurrentUser();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF262626),
      appBar: AppBar(
        backgroundColor: Color(0xFF262626),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Theme.of(context).primaryColor,
            size: 30,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: const Align(
          alignment: AlignmentDirectional(-0.6, 0),
          child: Text(
            'Обменяться',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Akshar',
              color: Colors.white,
              fontSize: 22,
            ),
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Expanded(
                  child: StreamBuilder(
                      stream: bloc.tickets,
                      builder: (context, AsyncSnapshot<TicketsList> snapshot) {
                        List<DropdownMenuItem> ticketItems = [];
                        if (snapshot.hasData) {
                          final tickets =
                              snapshot.data!.tickets.toList();
                          ticketItems.add(DropdownMenuItem(value: _dropdownValue, child: Text('Выберете билет')),);
                          for (var ticket in tickets) {
                            ticketItems.add(
                              DropdownMenuItem(
                                value: ticket.seat,
                                child: Text(
                                  ticket.seat!,
                                ),
                              ),
                            );
                          }
                        } else if (snapshot.hasError) {
                          return Text(snapshot.error.toString());
                        }
                        return DropdownButton(items: ticketItems,
                          onChanged: dropdownCallback(_dropdownValue),
                          value: _dropdownValue,);
                      }),
                ),
              ],
            ),
            Row(children: [
              StreamBuilder(
                stream: ubloc.user,
                builder: (context, AsyncSnapshot<UserModel> snapshot) {
                  if (snapshot.hasData) {
                    userId = snapshot.data!.id as Long;
                  } else {
                    return Text(snapshot.error.toString());
                  }
                },
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 16),
                  child: TextButton(
                    onPressed: () async {
                      widget.exchange.seatFromUser = userId as String?;
                      bloc.exchangeTicket(widget.exchange);
                    },
                    style: flatroundedButtonStyle,
                    child: const Text(
                      'Обменяться',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
