import 'package:flutter/material.dart';

import '../blocs/ticket_bloc.dart';
import '../models/lists/tickets_list.dart';
import '../models/user_model.dart';
import '../resources/util/flutter_session.dart';
import 'custom_widgets/ticket_card.dart';

class TicketsWidget extends StatefulWidget {
  const TicketsWidget({Key? key}) : super(key: key);

  @override
  _TicketsWidgetState createState() => _TicketsWidgetState();
}

class _TicketsWidgetState extends State<TicketsWidget> {
  UserModel? user;

  Future<UserModel?> _fetchCurrentUser() async {
    user = await FlutterSession().get("currentUser");
    print("fetched user ${user?.username}");
    print("start fetching tickets...");
    //_getUserTickets(user!.id!);
    print("got tickets");
    return user;
  }

  Future<TicketsList> _getUserTickets(int id) {
    return bloc.fetchTicketsByUserId(id);
  }

  @override
  void initState() {
    super.initState();
    // do something
    print("Build Tickets Page Completed");
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
              FutureBuilder<UserModel?>(
                  future: _fetchCurrentUser(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        return authorizedUserTickets(snapshot.data!.id!);
                      } else {
                        return Center(
                            child: Text(
                          'Зарегистрируйтесь или войдите, чтобы просматривать свои билеты',
                          style: TextStyle(
                              color: Theme.of(context).primaryColorLight),
                        ));
                      }
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center( child: Text(
                        "Заугрузка...",
                        style: TextStyle(color: Theme.of(context).primaryColorLight),
                      ));
                    }
                    return Text('State: ${snapshot.connectionState}');
                  }),
            ]),
      ),
    );
  }

  Widget authorizedUserTickets(int userId) {
    return Expanded(
        child: FutureBuilder<TicketsList>(
      future: _getUserTickets(userId),
      builder: (context, AsyncSnapshot<TicketsList> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            if(snapshot.data!.tickets.length == 0) {
              return Center(
                  child: Text(
                    'У вас пока нет билетов',
                    style: TextStyle(color: Theme.of(context).primaryColorLight),
                  ));
            }
            return ListView(
                children: List.generate(
                    snapshot.data!.tickets.length,
                    (index) => TicketCardWidget(
                        ticket: snapshot.data!.tickets[index])));
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return Center(
                child: Text(
              'У вас пока нет билетов',
              style: TextStyle(color: Theme.of(context).primaryColorLight),
            ));
          }
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center( child: Text(
            "Заугрузка...",
            style: TextStyle(color: Theme.of(context).primaryColorLight),
          ));
        } else {
          return Center(child: Text('State: ${snapshot.connectionState}'));
        }
      },
    ));
  }
}
