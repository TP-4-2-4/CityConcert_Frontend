import 'package:flutter/material.dart';

import '../../models/request_model.dart';
import '../custom_widgets/event_card.dart';
import 'exchange_page.dart';

class ExchangeDetailsPage extends StatefulWidget {
  final RequestModel exchange;

  const ExchangeDetailsPage({super.key, required this.exchange});

  @override
  _ExchangeDetailsPageState createState() => _ExchangeDetailsPageState();
}

class _ExchangeDetailsPageState extends State<ExchangeDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
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
            'Обмен билетов',
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
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 50, 16, 25),
            child: Text(
              widget.exchange.userId as String, //todo: bloc
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
            child: Text(
              widget.exchange.description!,
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
            child: Text(
              'Место автора: ${widget.exchange.seatFromUser}',
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
            child: Text(
              'Желаемое место: ${widget.exchange.wantedSeat}',
            ),
          ),
          Row(children: [
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 16),
                child: TextButton(
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ExchangePage(),
                      ),
                    );
                  },
                  style: flatroundedButtonStyle,
                  child: const Text(
                    'Обменяться',
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
    );
  }
}
