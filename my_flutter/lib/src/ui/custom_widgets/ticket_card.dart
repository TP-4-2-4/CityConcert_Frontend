import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_flutter/src/blocs/event_bloc.dart';
import 'package:my_flutter/src/models/event_model.dart';
import 'package:my_flutter/src/models/ticket_model.dart';

import '../event_details.dart';

class TicketCardWidget extends StatefulWidget {
  final TicketModel ticket;

  const TicketCardWidget({super.key, required this.ticket});

  @override
  _EventCardWidgetState createState() => _EventCardWidgetState();
}

class _EventCardWidgetState extends State<TicketCardWidget> {
  EventModel? event;

  Future<EventModel?> _getEvent() async {
    event = await bloc.fetchEventById(widget.ticket.eventId!);
    return event;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print("Got event in initState");
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EventDetailsPage(
                      event: event!,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorDark,
          borderRadius: BorderRadius.circular(16),
          shape: BoxShape.rectangle,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(32, 32, 16, 32),
              child: Icon(
                FontAwesomeIcons.barcode,
                color: Theme.of(context).primaryColorLight,
                size: 50,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(32, 32, 16, 32),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                      child: FutureBuilder<EventModel?>(
                        future: _getEvent(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Text("Загружается...");
                          } else if (snapshot.connectionState ==
                              ConnectionState.done) {
                            if (snapshot.hasData) {
                              return ListView(children: [
                                Text(
                                  snapshot.data!.name!.toUpperCase(),
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColorLight,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  snapshot.data!.startTime!,
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .primaryColorLight
                                        .withOpacity(0.40),
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ]);
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            }
                          } else {
                            return Text('State: ${snapshot.connectionState}');
                          }
                          return Text("");
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
