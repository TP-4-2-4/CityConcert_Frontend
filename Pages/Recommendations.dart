import '/components/concert_card_widget.dart';
import '/components/pillmenu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'recomendations_model.dart';
export 'recomendations_model.dart';

class RecomendationsWidget extends StatefulWidget {
  const RecomendationsWidget({Key? key}) : super(key: key);

  @override
  _RecomendationsWidgetState createState() => _RecomendationsWidgetState();
}

class _RecomendationsWidgetState extends State<RecomendationsWidget> {
  late RecomendationsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecomendationsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).alternate,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).alternate,
            automaticallyImplyLeading: false,
            title: Align(
              alignment: AlignmentDirectional(-1, 0),
              child: Text(
                'Рекомендации',
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: FlutterFlowTheme.of(context).accent1,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 2,
          ),
        ),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: [
                          wrapWithModel(
                            model: _model.concertCardModel,
                            updateCallback: () => setState(() {}),
                            child: ConcertCardWidget(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: wrapWithModel(
                  model: _model.pillmenuModel,
                  updateCallback: () => setState(() {}),
                  child: PillmenuWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
