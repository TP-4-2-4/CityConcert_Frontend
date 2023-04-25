import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'concert_details_model.dart';
export 'concert_details_model.dart';

class ConcertDetailsWidget extends StatefulWidget {
  const ConcertDetailsWidget({Key? key}) : super(key: key);

  @override
  _ConcertDetailsWidgetState createState() => _ConcertDetailsWidgetState();
}

class _ConcertDetailsWidgetState extends State<ConcertDetailsWidget> {
  late ConcertDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConcertDetailsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Stack(
                      children: [
                        Image.network(
                          'https://images.unsplash.com/photo-1505373877841-8d25f7d46678?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZXZlbnR8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
                          width: double.infinity,
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 90,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xB3090F13), Color(0x00090F13)],
                                stops: [0, 1],
                                begin: AlignmentDirectional(0, -1),
                                end: AlignmentDirectional(0, 1),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 40, 16, 16),
                          child: InkWell(
                            onTap: () async {
                              context.pop();
                            },
                            child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: Colors.transparent,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                                child: Icon(
                                  Icons.arrow_back_rounded,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 16, 12, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                            child: Text(
                              'Internal Team',
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.87,
                      height: 1,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 4),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              'Kickoff Meeting',
                              style:
                                  FlutterFlowTheme.of(context).headlineMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              'Short description goes here and can be more\nthan one line. Two lines is the best length… ',
                              style: FlutterFlowTheme.of(context).bodySmall,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                            child: Icon(
                              Icons.schedule,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 20,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                            child: Text(
                              '8:00am',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(24, 0, 0, 4),
                            child: Icon(
                              Icons.location_on_sharp,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 20,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                            child: Text(
                              'Kaleo Office - San Antionio...',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                            child: Text(
                              'Event Details',
                              style: FlutterFlowTheme.of(context).bodySmall,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 4),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                              child: Text(
                                'Drag-and-drop builder and no-code configuration make it easy to add chat to your app. Professionally designed templates and custom styling will take your app to the next level.Drag-and-drop builder and no-code configuration make it easy to add chat to your app. Professionally designed templates and custom styling will take your app to the next level.Drag-and-drop builder and no-code configuration make it easy to add chat to your app. Professionally designed templates and custom styling will take your app to the next level.',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 40),
                      child: FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: 'RSVP to Event',
                        options: FFButtonOptions(
                          width: 270,
                          height: 50,
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          iconPadding:
                              EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                          elevation: 2,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
