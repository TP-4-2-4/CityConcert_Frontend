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

  Future<void> _fetchCurrentUser() async {
      if(await FlutterSession().get("currentUser")){
        user = await FlutterSession().get("currentUser");
      }
      else {
        user = null;
      }
  }

  Future<void> _getUserTickets(int id) async {
    bloc.fetchTicketsByUserId(id);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // do something
      print("Build Completed");
      _fetchCurrentUser();
      if (user != null) {
        _getUserTickets(user!.id!);
      }
    });
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
            if (user != null) ...[
              Expanded(
                  child: StreamBuilder(
                stream: bloc.tickets,
                builder: (context, AsyncSnapshot<TicketsList> snapshot) {
                  if (snapshot.hasData) {
                    return ListView(
                        children: List.generate(
                            snapshot.data!.tickets.length,
                            (index) => TicketCardWidget(
                                ticket: snapshot.data!.tickets[index])));
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else {
                    return const Center(child: Text('Нет билетов ...'));
                  }
                },
              )),
            ] else ...[
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                child: Text(
                  "Зарегистрируйтесь или войдите, чтобы просматривать свои билеты",
                  style: TextStyle(color: Theme.of(context).primaryColorLight),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
