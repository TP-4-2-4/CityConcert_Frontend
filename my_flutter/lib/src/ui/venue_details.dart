import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_flutter/src/models/venue_model.dart';

class VenueDetailsPage extends StatefulWidget {
  final VenueModel venue;
  const VenueDetailsPage({super.key, required this.venue});
  @override
  _VenueDetailsPageState createState() => _VenueDetailsPageState();
}

class _VenueDetailsPageState extends State<VenueDetailsPage> {

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
                            image: MemoryImage(base64Decode(
                                widget.venue.image!)),
                            width: double.infinity,
                            height: 300,
                            fit: BoxFit.cover,
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0, 0),
                            child: Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
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
                            padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 40, 16,
                                16),
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
                                    color: Theme
                                        .of(context)
                                        .primaryColor,
                                    size: 24,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.87,
                        height: 1,
                        decoration: BoxDecoration(
                          color: Theme
                              .of(context)
                              .canvasColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12, 8, 12, 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                              child: Text(
                                widget.venue.name!,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Theme
                                      .of(context)
                                      .primaryColor,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12, 4, 12, 4),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12, 4, 12, 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 8, 4),
                              child: FaIcon(
                                Icons.location_on_sharp,
                                color: Theme
                                    .of(context)
                                    .primaryColor,
                                size: 22,
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                              child: Text(
                                widget.venue.location!,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color:
                                  Theme
                                      .of(context)
                                      .primaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12, 4, 12, 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 8, 4),
                              child: FaIcon(
                                FontAwesomeIcons.person,
                                color: Theme
                                    .of(context)
                                    .primaryColor,
                                size: 22,
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                              child: Text(
                                widget.venue.capacity!.toString(),
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color:
                                  Theme
                                      .of(context)
                                      .primaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12, 0, 12, 4),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                const EdgeInsetsDirectional.fromSTEB(
                                    0, 4, 0, 4),
                                child: Text(
                                  widget.venue.description!,
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                      color: Color(0xff9D9D9D)
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              ],
            ),
          ],
        ),
      ),
    );
  }
}