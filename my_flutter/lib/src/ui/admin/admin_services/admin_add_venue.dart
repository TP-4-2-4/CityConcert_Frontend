import 'package:flutter/material.dart';
import 'package:my_flutter/src/models/venue_model.dart';


import '../../../blocs/venue_bloc.dart';
import '../../custom_widgets/event_card.dart';
import 'admin_add_event.dart';

class AdminAddVenue extends StatefulWidget {
  @override
  _AdminAddVenueState createState() => _AdminAddVenueState();
}

class _AdminAddVenueState extends State<AdminAddVenue> {
  TextEditingController _venueNameController = TextEditingController();
  TextEditingController _venueLocationController = TextEditingController();
  TextEditingController _venueDescriptionController = TextEditingController();
  TextEditingController _venueCapacityController = TextEditingController();
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
            'Добавить площадку',
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
                controller: _venueNameController,
                hintText: "Название площадки"),
            InputField(controller: _venueLocationController, hintText: "Адрес"),
            InputField(
                controller: _venueDescriptionController, hintText: "Описание"),
            InputField(
                controller: _venueCapacityController, hintText: "Вместимость"),
            Row(children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 16),
                  child: TextButton(
                    onPressed: () async {
                      VenueModel venue = VenueModel(id:0, name:_venueNameController.text,
                          location:_venueLocationController.text,
                          description:_venueDescriptionController.text,capacity:int.parse(_venueCapacityController.text),
                          image: "r");
                    bloc.addVenue(venue);
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
