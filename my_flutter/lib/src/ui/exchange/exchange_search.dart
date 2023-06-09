import 'package:flutter/material.dart';
import 'package:my_flutter/src/ui/custom_widgets/exchange_card.dart';

import '../../blocs/request_bloc.dart';
import '../../models/lists/requests_list.dart';
import '../custom_widgets/event_card.dart';
import 'exchange_create.dart';

class SearchExchangeWidget extends StatefulWidget {
  const SearchExchangeWidget({Key? key}) : super(key: key);

  @override
  _SearchExchangeWidgetState createState() => _SearchExchangeWidgetState();
}

class _SearchExchangeWidgetState extends State<SearchExchangeWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // do something
      print("Build Completed");
      _getExchanges();
    });
  }

  Future<void> _getExchanges() async {
    bloc.fetchRequests("EXCHANGE");
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
      body: SafeArea(
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          Expanded(
              child: StreamBuilder(
            stream: bloc.requests,
            builder: (context, AsyncSnapshot<RequestsList> snapshot) {
              if (snapshot.hasData) {
                return ListView(
                    children: List.generate(
                        snapshot.data!.requests.length,
                        (index) => ExchangeCardWidget(
                            exchange: snapshot.data!.requests[index])));
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return const Center(child: Text('Нет обменов ...'));
              }
            },
          )),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateExchangeWidget()));
                    },
                    style: flatroundedButtonStyle,
                    child: const Text(
                      'Добавить запись',
                    ),
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
