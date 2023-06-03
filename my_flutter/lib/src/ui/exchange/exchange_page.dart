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
  late String _dropdownValue = "Выберете билет";
  late TicketModel selectedTicket;
  late UserModel user;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _getCurrentUserTickets(int userId) async {
    bloc.fetchTicketsByUserId(userId);
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                FutureBuilder<UserModel>(
                    future: _fetchCurrentUser(),
                    builder: (context, snapshot) {
                      return Text("Выбор билетов для пользователя ${user.id!}");
                    }),
                TextButton(
                  onPressed: () {
                    _getCurrentUserTickets(user.id!);
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
                                child: StreamBuilder(
                                  stream: bloc.tickets,
                                  builder: (context,
                                      AsyncSnapshot<TicketsList> snapshot) {
                                    if (snapshot.hasData) {
                                      return ListView(
                                          children: List.generate(
                                              snapshot.data!.tickets.length,
                                              (index) => TextButton(
                                                  onPressed: () {
                                                    selectedTicket = snapshot
                                                        .data!.tickets[index];
                                                  },
                                                  child: Text(snapshot.data!
                                                      .tickets[index].seat!))));
                                    } else if (snapshot.hasError) {
                                      return Text(snapshot.error.toString());
                                    } else {
                                      return const Center(
                                          child:
                                              Text('У Вас пока нет билетов'));
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
                  child: const Text('Выбрать отдаваемый билет'),
                ),
              ],
            ),
            Row(children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 16),
                  child: TextButton(
                    onPressed: () async {
                      if (selectedTicket.seat != null) {
                        widget.exchange.seatFromUser = selectedTicket.seat;
                        bloc.exchangeTicket(widget.exchange);
                      }
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
