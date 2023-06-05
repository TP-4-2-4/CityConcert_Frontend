import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_flutter/src/models/event_model.dart';

import '../../../blocs/event_bloc.dart';
import '../../custom_widgets/event_card.dart';
import '../admin_main.dart';

class AdminUpdateEvent extends StatefulWidget {
  final EventModel event;

  const AdminUpdateEvent(this.event);

  @override
  _AdminUpdateEventState createState() => _AdminUpdateEventState();
}

class _AdminUpdateEventState extends State<AdminUpdateEvent> {
  late TextEditingController _eventNameController;
  late TextEditingController _eventStartTimeController;
  late TextEditingController _eventTicketLimitController;
  late TextEditingController _eventTicketPriceController;
  late TextEditingController _eventGenreDescriptorsController;
  late TextEditingController _eventDescriptionController;
  late TextEditingController _eventVenueController;

  final ImagePicker picker = ImagePicker();

// Pick an image.
  late var _image;

  @override
  void initState() {
    super.initState();
    _eventNameController = TextEditingController(text: widget.event.name);
    _eventStartTimeController =
        TextEditingController(text: widget.event.startTime);
    _eventTicketLimitController =
        TextEditingController(text: widget.event.ticketLimit);
    _eventTicketPriceController =
        TextEditingController(text: widget.event.ticketPrice);
    _eventGenreDescriptorsController =
        TextEditingController(text: widget.event.genreDescriptors);
    _eventDescriptionController =
        TextEditingController(text: widget.event.description);
    _eventVenueController =
        TextEditingController(text: widget.event.venue.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Theme.of(context).primaryColor,
            size: 30,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: const Align(
          alignment: AlignmentDirectional(-0.6, 0),
          child: Text(
            'Изменить мероприятие',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                child: Text(
                  'id мероприятия: ${widget.event.id}',
                  style: TextStyle(color: Theme.of(context).primaryColorLight),
                )),
            TextFormField(
              controller: _eventNameController,
            ),
            TextFormField(
              controller: _eventStartTimeController,
            ),
            TextFormField(
              controller: _eventTicketLimitController,
            ),
            TextFormField(
              controller: _eventTicketPriceController,
            ),
            TextFormField(
              controller: _eventGenreDescriptorsController,
            ),
            TextFormField(
              controller: _eventDescriptionController,
            ),
            TextFormField(
              controller: _eventVenueController,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                child: IconButton(
                  style: flatroundedButtonStyleDark,
                  icon: Icon(
                    Icons.add,
                    color: Theme.of(context).primaryColorLight,
                    size: 24,
                  ),
                  onPressed: () async {
                    XFile? image = await picker.pickImage(
                        source: ImageSource.gallery,
                        imageQuality: 50,
                        preferredCameraDevice: CameraDevice.front);
                    setState(() {
                      _image = File(image!.path);
                    });
                    widget.event.image = base64Encode(_image.readAsBytesSync());
                  },
                ),
              ),
            ),
            Row(children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 16),
                  child: TextButton(
                    onPressed: () async {
                      EventModel event = EventModel(
                          id: widget.event.id,
                          name: _eventNameController.text,
                          description: _eventDescriptionController.text,
                          image: widget.event.image,
                          startTime: _eventStartTimeController.text,
                          ticketLimit: _eventTicketLimitController.text,
                          genreDescriptors:
                              _eventGenreDescriptorsController.text,
                          venue: int.parse(_eventVenueController.text),
                          ticketPrice: _eventTicketPriceController.text,
                          status: "SELLING");

                      bloc.updateEvent(event);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NavigationPageAdmin(),
                        ),
                      );
                    },
                    style: flatroundedButtonStyleDark,
                    child: const Text(
                      'Опубликовать',
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
            ]),
          ],
        ),
      ),
    );
  }
}

class InputField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;

  const InputField(
      {super.key, required this.controller, required this.hintText});

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 8),
      child: TextField(
        style: TextStyle(
          color: Theme.of(context).primaryColorLight,
        ),
        controller: widget.controller,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          filled: true,
          fillColor: Theme.of(context).primaryColorDark.withOpacity(0.6),
          hintText: widget.hintText,
          hintStyle: TextStyle(
              color: Theme.of(context).primaryColorLight.withOpacity(0.3)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(30.0),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 14.0,
            horizontal: 10.0,
          ),
        ),
      ),
    );
  }
}
