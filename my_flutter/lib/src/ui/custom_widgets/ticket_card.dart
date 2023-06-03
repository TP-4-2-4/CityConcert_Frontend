import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_flutter/src/blocs/event_bloc.dart';
import 'package:my_flutter/src/blocs/venue_bloc.dart' as vbloc;
import 'package:my_flutter/src/models/event_model.dart';
import 'package:my_flutter/src/models/ticket_model.dart';

import '../../models/venue_model.dart';
import '../event_details.dart';

class TicketCardWidget extends StatefulWidget {
  final TicketModel ticket;

  const TicketCardWidget({super.key, required this.ticket});

  @override
  _EventCardWidgetState createState() => _EventCardWidgetState();
}

class _EventCardWidgetState extends State<TicketCardWidget> {
  EventModel? event;

  Future<void> _getEvent() async {
    bloc.fetchEventById(widget.ticket.eventId!);
  }

  Future<void> _getVenue(int id) async {
    vbloc.bloc.fetchVenueById(id);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getEvent();
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
                      child: StreamBuilder(
                        stream: bloc.event,
                        builder: (context, AsyncSnapshot<EventModel> snapshot) {
                          if (snapshot.hasData) {
                            event = snapshot.data!;
                            _getVenue(event!.venue!);
                            return Text(
                              event!.name!.toUpperCase(),
                              style: TextStyle(
                                color: Theme.of(context).primaryColorLight,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Text(
                                'Не удалось получить мероприятие билета');
                          }
                          return Text("Event stream");
                        },
                      ),
                    ),
                    StreamBuilder(
                      stream: bloc.event,
                      builder: (context, AsyncSnapshot<EventModel> snapshot) {
                        if (snapshot.hasData) {
                          event = snapshot.data!;
                          return Text(
                            event!.startTime!,
                            style: TextStyle(
                              color: Theme.of(context)
                                  .primaryColorLight
                                  .withOpacity(0.40),
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Text('Не удалось получить мероприятие билета');
                        }
                        return Text("Event stream");
                      },
                    ),
                    StreamBuilder(
                      stream: vbloc.bloc.venue,
                      builder: (context, AsyncSnapshot<VenueModel> snapshot) {
                        if (snapshot.hasData) {
                          return Text(
                            snapshot.data!.name!,
                            style: TextStyle(
                              color: Theme.of(context)
                                  .primaryColorLight
                                  .withOpacity(0.40),
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Text('Не удалось получить площадку билета');
                        }
                        return Text("Venue stream");
                      },
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
