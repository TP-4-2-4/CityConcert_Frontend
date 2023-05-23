import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../blocs/event_bloc.dart';
import '../models/lists/events_list.dart';
import 'custom_widgets/event_card.dart';

class RecommendationsPage extends StatefulWidget {
  const RecommendationsPage({super.key});



  @override
  _RecommendationsPageState createState() => _RecommendationsPageState();
}

class _RecommendationsPageState extends State<RecommendationsPage>{
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
        padding: const EdgeInsets.all(16.0),
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
                      return const Center(child: Text('Нет мероприятий ...'));
                    }
                  },
                )),
          ],
        ),
      ),
    );
  }
  Future<void> _getInitialEvents() async {
    bloc.fetchEventsRecommendations();
  }
}