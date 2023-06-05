import 'package:flutter/material.dart';

import '../../blocs/user_bloc.dart';
import '../../models/request_model.dart';
import '../../models/user_model.dart';
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
  void initState() {
    super.initState();
    bloc.fetchUserById(widget.exchange.userId!);
  }

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
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 50, 16, 25),
            child: StreamBuilder(
              stream: bloc.user,
              builder: (context, AsyncSnapshot<UserModel> snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    snapshot.data!.username!,
                    style: TextStyle(
                        color: Theme.of(context).primaryColorLight,
                        fontWeight: FontWeight.bold),
                  );
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                  return Text(
                    'Пользователь обмена загрудается...',
                    style: TextStyle(
                        color: Theme.of(context)
                            .primaryColorLight
                            .withOpacity(0.6)),
                  );
                }
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
              child: Text(widget.exchange.description!,
                  style: TextStyle(color: Theme.of(context).primaryColorLight)),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
            child: Text('Место автора: ${widget.exchange.currentSeat}',
                style: TextStyle(color: Theme.of(context).primaryColorLight)),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
            child: Text('Желаемое место: ${widget.exchange.wantedSeat}',
                style: TextStyle(color: Theme.of(context).primaryColorLight)),
          ),
          Row(children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 16),
                child: TextButton(
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ExchangePage(exchange: widget.exchange),
                      ),
                    );
                  },
                  style: flatroundedButtonStyle,
                  child: const Text(
                    'Обменяться',
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
