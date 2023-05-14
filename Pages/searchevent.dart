import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'search_event_model.dart';
export 'search_event_model.dart';

class SearchEventWidget extends StatefulWidget {
  const SearchEventWidget({Key? key}) : super(key: key);

  @override
  _SearchEventWidgetState createState() => _SearchEventWidgetState();
}

class _SearchEventWidgetState extends State<SearchEventWidget> {
  late SearchEventModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchEventModel());

    _model.textController ??= TextEditingController(text: 'Введите слово');
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
        backgroundColor: Color(0xFF262626),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(25, 25, 0, 0),
                    child: Text(
                      'Поиск мероприятия',
                      textAlign: TextAlign.justify,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 24,
                          ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(25, 25, 25, 0),
                    child: Container(
                      width: double.infinity,
                      child: TextFormField(
                        controller: _model.textController,
                        autofocus: true,
                        textCapitalization: TextCapitalization.none,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintStyle:
                              FlutterFlowTheme.of(context).bodySmall.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0x4D131313),
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(29),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(29),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(29),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(29),
                          ),
                          filled: true,
                          fillColor: Color(0x4D131313),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              color: Color(0x4DD9D9D9),
                              fontSize: 20,
                            ),
                        validator:
                            _model.textControllerValidator.asValidator(context),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.78, 1.44),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 60,
                        icon: Icon(
                          Icons.search,
                          color: Color(0xFFFC17EA),
                          size: 25,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(25, 565, 25, 0),
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: Color(0x80131313),
                  elevation: 100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 0, 10, 0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30,
                          borderWidth: 1,
                          buttonSize: 60,
                          icon: Icon(
                            Icons.format_list_bulleted,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 30,
                          ),
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30,
                          borderWidth: 1,
                          buttonSize: 60,
                          icon: Icon(
                            Icons.location_on,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 30,
                          ),
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30,
                          borderWidth: 1,
                          buttonSize: 60,
                          icon: Icon(
                            Icons.search,
                            color: Color(0x4DD9D9D9),
                            size: 30,
                          ),
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),
                      ),
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 60,
                        icon: Icon(
                          Icons.person,
                          color: Color(0xFF131313),
                          size: 30,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
