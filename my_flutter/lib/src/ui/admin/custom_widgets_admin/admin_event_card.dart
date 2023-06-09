import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_flutter/src/blocs/event_bloc.dart';
import 'package:my_flutter/src/models/event_model.dart';
import 'package:my_flutter/src/ui/admin/admin_services/admin_update_event.dart';



class AdminEventCardWidget extends StatefulWidget {
  final EventModel event;

  const AdminEventCardWidget({super.key, required this.event});

  @override
  _AdminEventCardWidgetState createState() => _AdminEventCardWidgetState();
}

class _AdminEventCardWidgetState extends State<AdminEventCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: Image.memory(base64Decode(widget.event.image!)),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
                child: TextButton(
                  onPressed: () {},
                  child: Text(widget.event.name!),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                child: TextButton(
                  onPressed: () {

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  AdminUpdateEvent(widget.event),
                      ),
                    );
                  },
                  style: editButtonStyle,
                  child: const Text(
                    'Редактировать',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                child: TextButton(
                  onPressed: () async {
                   bloc.deleteEventById(widget.event.id!);
                  },
                  style: deleteButtonStyle,
                  child: const Text(
                    'Удалить',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

final ButtonStyle editButtonStyle = TextButton.styleFrom(
  backgroundColor: const Color.fromRGBO(252, 23, 229, 1),
  minimumSize: const Size(150, 50),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(30.0)),
  ),
);
final ButtonStyle deleteButtonStyle = TextButton.styleFrom(
  backgroundColor: const Color.fromRGBO(101, 101, 101, 1),
  minimumSize: const Size(150, 50),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(30.0)),
  ),
);

final ButtonStyle eventNameButtonStyle = TextButton.styleFrom(
  backgroundColor: const Color.fromRGBO(101, 101, 101, 1),
  minimumSize: const Size(300, 40),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(16),
      bottomRight: Radius.circular(16),
      topLeft: Radius.circular(0),
      topRight: Radius.circular(0),
    ),
  ),
);
