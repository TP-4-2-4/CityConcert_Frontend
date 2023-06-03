import 'package:flutter/material.dart';
import 'package:my_flutter/src/models/request_model.dart';
import 'package:my_flutter/src/models/ticket_model.dart';
import 'package:my_flutter/src/models/user_model.dart';
import '../../models/lists/tickets_list.dart';
import '../../resources/util/flutter_session.dart';
import '../custom_widgets/event_card.dart';

import '../../blocs/ticket_bloc.dart';

class CreateExchangeWidget extends StatefulWidget {
  const CreateExchangeWidget({Key? key}) : super(key: key);

  @override
  _CreateExchangeWidgetState createState() => _CreateExchangeWidgetState();
}

class _CreateExchangeWidgetState extends State<CreateExchangeWidget> {
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _wantedSeatController = TextEditingController();

  late UserModel user;
  late TicketModel selectedTicket;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<UserModel> _fetchCurrentUser() async {
    user = await FlutterSession().get("currentUser");
    print(user.username);
    return user;
  }

  Future<void> _getCurrentUserTickets(int userId) async {
    bloc.fetchTicketsByUserId(userId);
  }

  Future<void> _createExchange() async {
    RequestModel newExchange = RequestModel(
        userId: selectedTicket.userId,
        eventId: selectedTicket.eventId,
        requestType: "EXCHANGE",
        description: _descriptionController.text,
        currentSeat: selectedTicket.seat,
        wantedSeat: _wantedSeatController.text,
        seatFromUser: "");
    bloc.exchangeTicket(newExchange);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
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
            'Обмен билетов',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
        ),
        actions: const [],
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
          children: [
            FutureBuilder<UserModel>(
                future: _fetchCurrentUser(),
                builder: (context, snapshot) {
                  return Text(
                      "Выбор билетов для пользователя ${user.username}");
                }),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 8),
              child: TextField(
                style: TextStyle(
                  color: Theme.of(context).primaryColorLight,
                ),
                controller: _descriptionController,
                cursorColor: Theme.of(context).primaryColor,
                maxLines: 8,
                minLines: 1,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.black54,
                  hintText: 'Полное описание',
                  hintStyle: TextStyle(
                    color: Theme.of(context).primaryColorLight,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 14.0,
                    horizontal: 10.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 8),
              child: TextField(
                style: TextStyle(
                  color: Theme.of(context).primaryColorLight,
                ),
                controller: _wantedSeatController,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.black54,
                  hintText: 'Желаемый билет',
                  hintStyle: TextStyle(
                    color: Theme.of(context).primaryColorLight,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 14.0,
                    horizontal: 10.0,
                  ),
                ),
              ),
            ),
            Row(
              children: [
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
                                                    Navigator.pop(context);
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
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16, 90, 16, 0),
                    child: TextButton(
                      onPressed: () {
                        if (selectedTicket.seat != null) {
                          _createExchange();
                        }
                      },
                      style: flatroundedButtonStyle,
                      child: const Text(
                        'Опубликовать',
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
