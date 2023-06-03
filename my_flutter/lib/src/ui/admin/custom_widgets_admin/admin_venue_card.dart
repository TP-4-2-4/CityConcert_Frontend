import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_flutter/src/ui/admin/admin_services/admin_update_venue.dart';

import '../../../blocs/venue_bloc.dart';
import '../../../models/venue_model.dart';
import 'admin_event_card.dart';

class AdminVenueCardWidget extends StatefulWidget {
  final VenueModel venue;

  const AdminVenueCardWidget({super.key, required this.venue});

  @override
  _AdminVenueCardWidgetState createState() => _AdminVenueCardWidgetState();
}

class _AdminVenueCardWidgetState extends State<AdminVenueCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
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
                  child: Image.memory(base64Decode(widget.venue.image!)),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
                child: TextButton(
                  onPressed: () {},
                  child: Text(widget.venue.name!),
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
                        builder: (context) =>  AdminUpdateVenue(widget.venue),
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
                  onPressed: () {
                    bloc.deleteVenueById(widget.venue.id!);

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
