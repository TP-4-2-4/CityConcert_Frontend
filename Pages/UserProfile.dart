import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'profile_model.dart';
export 'profile_model.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  late ProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileModel());
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
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFF262626),
          ),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(13, 710, 15, 0),
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: Color(0xD5FC17E5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30,
                          borderWidth: 1,
                          buttonSize: 60,
                          icon: Icon(
                            Icons.home_rounded,
                            color: Color(0x80131313),
                            size: 40,
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
                        icon: FaIcon(
                          FontAwesomeIcons.bolt,
                          color: Color(0x80131313),
                          size: 30,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 60,
                        icon: Icon(
                          Icons.search_rounded,
                          color: Color(0x80131313),
                          size: 40,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30,
                          borderWidth: 1,
                          buttonSize: 60,
                          icon: FaIcon(
                            FontAwesomeIcons.ticketAlt,
                            color: Color(0x80131313),
                            size: 30,
                          ),
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30,
                          borderWidth: 1,
                          buttonSize: 60,
                          icon: Icon(
                            Icons.person_rounded,
                            color: Color(0xD9131313),
                            size: 40,
                          ),
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 470),
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: Color(0xB8201F1F),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(100, 100, 100, 0),
                        child: Container(
                          width: 150,
                          height: 150,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/images/leopolldo.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 15, 0, 0),
                        child: Text(
                          'Ольга Дьяконова',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF9D9D9D),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(25, 25, 0, 0),
                child: Text(
                  'Профиль',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        color: Color(0xFFD9D9D9),
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 380, 10, 0),
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: Color(0xCF201F1F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 15, 75, 15),
                    child: Text(
                      'somauserpaddress@gmail.com',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            color: Color(0x689D9D9D),
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 450, 10, 0),
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: Color(0xFFFC17E5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Stack(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(30, 10, 0, 0),
                            child: Text(
                              'Новые возможности',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(68, 10, 0, 0),
                            child: Icon(
                              Icons.close_rounded,
                              color: Color(0xA3131313),
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(30, 50, 30, 20),
                        child: Text(
                          'Теперь вам доступны новые функции! Вы можете просматривать все заказы на вкладке “Мои билеты”, персональные рекомендации на вкладке “Рекомендации”, а также обмениваться билетами с другими пользователями и создавать компании друзей для похода на мероприятние!',
                          textAlign: TextAlign.justify,
                          style: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                lineHeight: 1,
                              ),
                        ),
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
