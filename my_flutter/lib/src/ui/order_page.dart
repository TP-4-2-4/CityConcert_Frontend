import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_flutter/src/models/event_model.dart';
import 'package:my_flutter/src/ui/successful_payment_page.dart';

import 'custom_widgets/event_card.dart';

class OrderPage extends StatefulWidget {
  final EventModel event;

  const OrderPage({super.key, required this.event});

  @override
  _OrderPageState createState() => _OrderPageState();
}
//todo: get event model here by id
class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Купить билет',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image(
                      image: MemoryImage(base64Decode(
                          widget.event.image!.join())),
                      width: 136,
                      height: 136,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 8, 0, 16),
                            child: Text(
                              widget.event as String,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Theme.of(context).primaryColorLight,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Text(
                            widget.event.startTime!,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Theme.of(context).primaryColorLight,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            widget.event.name!, //todo:get venue name
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Theme.of(context).primaryColorLight,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                    child: Text(
                      'Выберете зону',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Theme.of(context).primaryColorLight,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16, 16, 16, 16),
                        child: TextButton(
                          onPressed: () {
                            print('Button pressed ...');
                          },
                          style: flatroundedButtonStyle,
                          child: const Text('A1 - A10 1500'), //todo: tickets
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SuccessfulPaymentPage()));
                      },
                      style: flatroundedButtonStyle,
                      child: const Text('Оплатить'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
