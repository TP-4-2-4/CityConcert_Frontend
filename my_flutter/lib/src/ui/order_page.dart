import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  final int eventId;

  const OrderPage({super.key, required this.eventId});

  @override
  _OrderPageState createState() => _OrderPageState();
}
  //todo: get event model here by id
class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(38, 38, 38, 1),
      appBar: AppBar(
        //todo: add arrow back
        title: const Text('Купить билет'),
      ),
      body: Center(
        child: Text('Event ID: ${widget.eventId}'),
      ),
    );
  }
}
