import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_flutter/src/models/event_model.dart';

import '../../../blocs/event_bloc.dart';
import '../../custom_widgets/event_card.dart';
import '../admin_main.dart';

class AdminAddEvent extends StatefulWidget {
  @override
  _AdminAddEventState createState() => _AdminAddEventState();
}

class _AdminAddEventState extends State<AdminAddEvent> {
  TextEditingController _eventIdController = TextEditingController();
  TextEditingController _eventNameController = TextEditingController();
  TextEditingController _eventStartTimeController = TextEditingController();
  TextEditingController _eventTicketLimitController = TextEditingController();
  TextEditingController _eventTicketPriceController = TextEditingController();
  TextEditingController _eventGenreDescriptorsController =
      TextEditingController();
  TextEditingController _eventDescriptionController = TextEditingController();
  TextEditingController _eventVenueController = TextEditingController();

  final ImagePicker picker = ImagePicker();

// Pick an image.
  late var _image;

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
            'Добавить мероприятие',
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
            InputField(
                controller: _eventIdController, hintText: "Id мероприятия"),
            InputField(
                controller: _eventNameController,
                hintText: "Название мероприятия"),
            InputField(
                controller: _eventStartTimeController,
                hintText: "Время начала"),
            InputField(
                controller: _eventTicketLimitController,
                hintText: "Количество билетов"),
            InputField(
                controller: _eventTicketPriceController,
                hintText: "Цена билета"),
            InputField(
                controller: _eventGenreDescriptorsController,
                hintText: "Жанровые дескрипторы"),
            InputField(
                controller: _eventDescriptionController, hintText: "Описание"),
            InputField(controller: _eventVenueController, hintText: "Площадка"),
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
                          id: int.parse(_eventIdController.text),
                          name: _eventNameController.text,
                          description: _eventDescriptionController.text,
                          image: base64Encode(_image.readAsBytesSync()),
                          startTime: _eventStartTimeController.text,
                          ticketLimit: _eventTicketLimitController.text,
                          genreDescriptors:
                              _eventGenreDescriptorsController.text,
                          venue: int.parse(_eventVenueController.text),
                          ticketPrice: _eventTicketPriceController.text,
                          status: "SELLING");

                      bloc.addEvent(event);
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
