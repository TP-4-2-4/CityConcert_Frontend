import 'package:flutter/material.dart';

import '../../blocs/event_bloc.dart';
import '../../models/lists/events_list.dart';
import '../custom_widgets/event_card.dart';
import 'custom_widgets_admin/admin_event_card.dart';

class AdminEventsPage extends StatefulWidget {
  @override
  _AdminEventsPageState createState() => _AdminEventsPageState();
}

class _AdminEventsPageState extends State<AdminEventsPage> {
  Future<void> _getInitialEvents() async {
    bloc.fetchEventsGetAll();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // do something
      print("Build Completed");
      _getInitialEvents();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                      child: IconButton(
                        style: flatroundedButtonStyleDark,
                        icon: Icon(
                          Icons.add,
                          color: Theme.of(context).primaryColorLight,
                          size: 24,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Expanded(
                  child: StreamBuilder(
                stream: bloc.events,
                builder: (context, AsyncSnapshot<EventsList> snapshot) {
                  if (snapshot.hasData) {
                    return ListView(
                        children: List.generate(
                            snapshot.data!.events.length,
                            (index) => AdminEventCardWidget(
                                event: snapshot.data!.events[index])));
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else {
                    return const Center(child: Text('Нет мероприятий ...'));
                  }
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}
