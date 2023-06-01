import 'package:flutter/material.dart';

import '../../models/request_model.dart';

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
      backgroundColor: const Color.fromRGBO(38, 38, 38, 1),
      body: SingleChildScrollView(
        child: Column(),
      ),
    );
  }
}
