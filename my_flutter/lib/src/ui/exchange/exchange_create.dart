
import 'package:flutter/material.dart';
import 'package:my_flutter/src/models/request_model.dart';
import 'package:my_flutter/src/models/ticket_model.dart';
import 'package:my_flutter/src/models/user_model.dart';
import '../../models/lists/tickets_list.dart';
import '../custom_widgets/event_card.dart';

import '../../blocs/user_bloc.dart' as ubloc;
import '../../blocs/ticket_bloc.dart' as tbloc;

class CreateExchangeWidget extends StatefulWidget {
  const CreateExchangeWidget({Key? key}) : super(key: key);

  @override
  _CreateExchangeWidgetState createState() => _CreateExchangeWidgetState();
}

class _CreateExchangeWidgetState extends State<CreateExchangeWidget> {
  final String _dropdownValue = "Выберете билет";
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _wantedSeatController = TextEditingController();

  int? userId;
  late TicketModel selectedTicket;

  @override
  void initState() {
    super.initState();
    ubloc.bloc.fetchCurrentUser();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _fetchTicketsByUserId(int userId) {
    tbloc.bloc.fetchTicketsByUserId(userId);
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
    tbloc.bloc.exchangeTicket(newExchange);
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
        child: ListView(
          children: [
            StreamBuilder(
              stream: ubloc.bloc.user,
              builder: (context, AsyncSnapshot<UserModel> snapshot) {
                if (snapshot.hasData) {
                  userId = snapshot.data!.id;
                  _fetchTicketsByUserId(userId!);
                } else {
                  return Text(snapshot.error.toString());
                }
                return Text("Выбор билетов для пользователя $userId");
              },
            ),
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
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                child: StreamBuilder(
                    stream: tbloc.bloc.tickets,
                    builder: (context, AsyncSnapshot<TicketsList> snapshot) {
                      List<DropdownMenuItem> ticketItems = [];
                      if (snapshot.hasData) {
                        final tickets = snapshot.data!.tickets.toList();
                        ticketItems.add(
                          DropdownMenuItem(
                              value: _dropdownValue,
                              child: const Text('Отдаваемый билет')),
                        );
                        for (var ticket in tickets) {
                          ticketItems.add(
                            DropdownMenuItem(
                              value: ticket,
                              child: Text(
                                ticket.seat!,
                              ),
                            ),
                          );
                        }
                      } else if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      }
                      return DropdownButton(
                        items: ticketItems,
                        //onChanged: dropdownCallback(_dropdownValue),
                        value: _dropdownValue,
                        onChanged: (value) {
                          setState(() {
                            selectedTicket = value;
                          });
                        },
                      );
                    }),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 90, 16, 0),
                child: TextButton(
                  onPressed: () {
                    _createExchange();
                  },
                  style: flatroundedButtonStyle,
                  child: const Text(
                    'Опубликовать',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
