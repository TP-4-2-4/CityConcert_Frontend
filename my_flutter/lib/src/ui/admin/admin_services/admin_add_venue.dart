import 'package:flutter/material.dart';

import '../../custom_widgets/event_card.dart';
import '../admin_main.dart';
import 'admin_add_event.dart';

class AdminAddEvent extends StatefulWidget {
  @override
  _AdminAddEventState createState() => _AdminAddEventState();
}

class _AdminAddEventState extends State<AdminAddEvent> {
  TextEditingController _venueNameController = TextEditingController();
  TextEditingController _venueLocationController = TextEditingController();
  TextEditingController _venueDescriptionController = TextEditingController();

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
            Row(children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 16),
                  child: TextButton(
                    onPressed: () async {
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
