import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../blocs/event_bloc.dart';
import '../models/lists/events_list.dart';
import 'custom_widgets/event_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});



  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
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
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            const SizedBox(height: 16.0),
            Expanded(
                child: StreamBuilder(
                  stream: bloc.events,
                  builder: (context, AsyncSnapshot<EventsList> snapshot) {
                    if (snapshot.hasData) {
                      return ListView(
                          children: List.generate(
                              snapshot.data!.events.length,
                                  (index) => EventCardWidget(
                                  event: snapshot.data!.events[index])));
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    } else {
                      return Center(
                        child: Text(
                          'Мероприятия загружаются ...',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      );
                    }
                  },
                )),
          ],
        ),
      ),
    );
  }
  Future<void> _getInitialEvents() async {
    bloc.fetchEventsGetAll();
  }
}

