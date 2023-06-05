import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_flutter/src/models/lists/tickets_list.dart';
import 'package:my_flutter/src/models/ticket_model.dart';
import '../../blocs/ticket_bloc.dart';
import '../../models/request_model.dart';
import '../../models/user_model.dart';
import '../../resources/util/flutter_session.dart';
import '../custom_widgets/event_card.dart';

class ExchangePage extends StatefulWidget {
  final RequestModel exchange;

  const ExchangePage({Key? key, required this.exchange}) : super(key: key);

  @override
  _ExchangePageState createState() => _ExchangePageState();
}

class _ExchangePageState extends State<ExchangePage> {
  TicketModel? selectedTicket;
  late UserModel user;

  @override
  void initState() {
    super.initState();
    _fetchCurrentUser();
  }

  Future<TicketsList> _getCurrentUserTickets(int userId) async {
    return bloc.fetchTicketsByUserId(userId);
  }

  Future<UserModel> _fetchCurrentUser() async {
    user = await FlutterSession().get("currentUser");
    print(user.username);
    return user;
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
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
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
                                    future: _getCurrentUserTickets(user.id!),
                                    builder: (context,
                                        AsyncSnapshot<TicketsList> snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.done) {
                                        if (snapshot.hasData) {
                                          if (snapshot.data!.tickets.length ==
                                              0) {
                                            return Center(
                                                child: Text(
                                              'У вас пока нет билетов',
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColorLight),
                                            ));
                                          }
                                          return ListView(
                                              children: List.generate(
                                                  snapshot.data!.tickets.length,
                                                  (index) => TextButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          selectedTicket =
                                                              snapshot.data!
                                                                      .tickets[
                                                                  index];
                                                        });
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text(snapshot
                                                          .data!
                                                          .tickets[index]
                                                          .seat!))));
                                        } else if (snapshot.hasError) {
                                          return Text(
                                              snapshot.error.toString());
                                        } else {
                                          return Center(
                                              child: Text(
                                            'У Вас пока нет билетов',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColorLight),
                                          ));
                                        }
                                      } else if (snapshot.connectionState ==
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
                      'Выбрать отдаваемый билет',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ]),
            ),
            const Expanded(
                child: Padding(
              padding: EdgeInsets.all(8),
            )),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
              child: Text(
                selectedTicket != null
                    ? 'Обменять место ${selectedTicket!.seat}'
                    : 'Билет для обмена пока не выбран',
                style: TextStyle(
                    color: Theme.of(context).primaryColorLight,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Row(children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                  child: TextButton(
                    onPressed: () async {
                      if (selectedTicket != null) {
                        widget.exchange.seatFromUser = selectedTicket!.seat;
                        print(
                            '${widget.exchange.userId}, ${widget.exchange.eventId}, ${widget.exchange.requestType}, ${widget.exchange.description}, ${widget.exchange.currentSeat}, ${widget.exchange.wantedSeat}, ${widget.exchange.seatFromUser}');
                        bloc.exchangeTicket(widget.exchange);
                      }
                    },
                    style: flatroundedButtonStyle,
                    child: const Text(
                      'Обменяться',
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
