import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/src/blocs/ticket_bloc.dart';
import 'package:my_flutter/src/models/user_model.dart';
import 'package:my_flutter/src/ui/admin/admin_services/admin_add_event.dart';
import 'package:my_flutter/src/ui/successful_payment_page.dart';
import 'package:my_flutter/src/models/ticket_model.dart';

import '../resources/util/flutter_session.dart';
import 'custom_widgets/event_card.dart';

class PaymentPage extends StatefulWidget {
  final TicketModel ticket;

  const PaymentPage({super.key, required this.ticket});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  TextEditingController _userEmailController = TextEditingController();

  Future<UserModel> _fetchCurrentUser() async {
    UserModel user = await FlutterSession().get("currentUser");
    print(user.username);
    return user;
  }
  @override
  Widget build(BuildContext context) {
    widget.ticket.userId = 0;
    String defaultDate = DateTime.now().toString();
    widget.ticket.purchaseDate = "${defaultDate.substring(0,10)}T${defaultDate.substring(11)}";
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
            'Оплата',
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
      body: Column(children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
          child: Text(
            'Введите почту для получения билета: ',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Theme.of(context).primaryColorLight,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        FutureBuilder<UserModel>(
            future: _fetchCurrentUser(),
            builder: (context, AsyncSnapshot<UserModel> snapshot) {
              if(snapshot.connectionState ==
                  ConnectionState.done) {
                if (snapshot.hasData) {
                    _userEmailController.text = snapshot.data!.email!;
                    widget.ticket.userId = snapshot.data!.id;
                }
              }
              return Text('');
            }),
        InputField(controller: _userEmailController, hintText: ''),
        const SizedBox(
          height: 100,
        ),
        Padding(padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
          child: Text(
            'Ваше место: ${widget.ticket.seat} стоимость ${widget.ticket.price}',
            style: TextStyle(
                color: Theme.of(context).primaryColorLight,
                fontWeight: FontWeight.bold
            ),
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
                    print('trying to buy ticket: ${widget.ticket.id}, ${widget.ticket.price}, ${widget.ticket.seat}, ${widget.ticket.status}, ${widget.ticket.purchaseDate}, ${widget.ticket.userId}, ${widget.ticket.eventId}');
                    bloc.buyTicket(widget.ticket);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const SuccessfulPaymentPage()));
                  },
                  style: flatroundedButtonStyle,
                  child: const Text('Оплатить'),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
