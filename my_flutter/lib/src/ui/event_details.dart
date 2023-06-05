import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_flutter/src/models/venue_model.dart';
import 'package:my_flutter/src/ui/company/company_search.dart';
import 'package:my_flutter/src/ui/exchange/exchange_search.dart';
import 'package:my_flutter/src/ui/venue_details.dart';

import '../blocs/venue_bloc.dart';
import '../models/event_model.dart';
import '../models/user_model.dart';
import '../resources/util/flutter_session.dart';
import 'custom_widgets/event_card.dart';
import 'order_page.dart';

class EventDetailsPage extends StatefulWidget {
  final EventModel event;

  const EventDetailsPage({super.key, required this.event});

  @override
  _EventDetailsPageState createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  VenueModel? venue;
  String? venueName;

  Future<UserModel?> _fetchCurrentUser() async {
    UserModel user = await FlutterSession().get("currentUser");
    return user;
  }

  Future<VenueModel?> _fetchVenueName() async {
    venue = await bloc.fetchVenueById(widget.event.venue!);
    return venue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(38, 38, 38, 1),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Stack(
                        children: [
                          Image(
                            image:
                                MemoryImage(base64Decode(widget.event.image!)),
                            width: double.infinity,
                            height: 300,
                            fit: BoxFit.cover,
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 90,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xB3090F13),
                                    Color(0x00090F13)
                                  ],
                                  stops: [0, 1],
                                  begin: AlignmentDirectional(0, -1),
                                  end: AlignmentDirectional(0, 1),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16, 40, 16, 16),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                Navigator.pop(
                                    context); // Возврат на предыдущую страницу
                              },
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: Colors.transparent,
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      4, 4, 4, 4),
                                  child: Icon(
                                    Icons.arrow_back_rounded,
                                    color: Theme.of(context).primaryColor,
                                    size: 24,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.87,
                        height: 1,
                        decoration: BoxDecoration(
                          color: Theme.of(context).canvasColor,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(12, 8, 12, 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 4, 0, 0),
                              child: Text(
                                widget.event.name!,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                widget.event.genreDescriptors!,
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                    color: Color(0xff9D9D9D)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(12, 4, 12, 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 8, 4),
                              child: FaIcon(
                                FontAwesomeIcons.clock,
                                color: Theme.of(context).primaryColor,
                                size: 22,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  4, 0, 0, 0),
                              child: Text(
                                widget.event.startTime!,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24, 0, 8, 4),
                              child: Icon(
                                Icons.location_on_sharp,
                                color: Theme.of(context).primaryColor,
                                size: 22,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  4, 0, 0, 0),
                              child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    print('venue name pushed');
                                    if (venue != null) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              VenueDetailsPage(venue: venue!),
                                        ),
                                      );
                                    } else {}
                                  },
                                  child: FutureBuilder<VenueModel?>(
                                    future: _fetchVenueName(), // async work
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return Text(
                                          "Загружается...",
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        );
                                      } else if (snapshot.connectionState ==
                                          ConnectionState.done) {
                                        if (snapshot.hasError) {
                                          return Text(
                                              'Error: ${snapshot.error.toString().substring(0, 10)}...');
                                        } else {
                                          return Text(
                                            '${snapshot.data!.name!.substring(0, 15)}...',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          );
                                        }
                                      } else {
                                        return Text(
                                            'State: ${snapshot.connectionState.toString().substring(0, 10)}...');
                                      }
                                    },
                                  )),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(12, 4, 12, 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 8, 4),
                              child: FaIcon(
                                FontAwesomeIcons.rubleSign,
                                color: Theme.of(context).primaryColor,
                                size: 22,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  4, 0, 0, 0),
                              child: Text(
                                widget.event.ticketPrice!,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 4),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 4, 0, 4),
                                child: Text(
                                  widget.event.description!,
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 15,
                                      color: Color(0xff9D9D9D)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  FutureBuilder<UserModel?>(
                    future: _fetchCurrentUser(), // async work
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Text(
                          "...",
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        if (snapshot.hasData) {
                          return authorizedButtonsRow();
                        } else {
                          return unAuthorizedButtonsRow();
                        }
                      } else {
                        return Text('State: ${snapshot.connectionState}');
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget unAuthorizedButtonsRow() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 16),
            child: TextButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderPage(event: widget.event),
                  ),
                );
              },
              style: flatroundedButtonStyle,
              child: const Text(
                'Купить билет',
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
      ],
    );
  }

  Widget authorizedButtonsRow() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 4, 16),
          child: IconButton(
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchCompanyWidget(),
                ),
              );
            },
            style: flatroundedButtonStyle,
            icon: Icon(
              Icons.emoji_people_rounded,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(4, 8, 0, 16),
          child: IconButton(
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchExchangeWidget(),
                ),
              );
            },
            style: flatroundedButtonStyle,
            icon: Icon(
              Icons.handshake_rounded,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 16),
            child: TextButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderPage(event: widget.event),
                  ),
                );
              },
              style: flatroundedButtonStyle,
              child: const Text(
                'Купить билет',
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
      ],
    );
  }
}
