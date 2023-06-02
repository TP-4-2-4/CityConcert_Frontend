import 'package:flutter/material.dart';

import '../../blocs/venue_bloc.dart';
import '../../models/lists/venues_list.dart';
import '../custom_widgets/event_card.dart';
import 'custom_widgets_admin/admin_venue_card.dart';

class AdminVenuesPage extends StatefulWidget {
  @override
  _AdminVenuesPageState createState() => _AdminVenuesPageState();
}

class _AdminVenuesPageState extends State<AdminVenuesPage> {
  Future<void> _getInitialVenues() async {
    bloc.fetchVenues();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // do something
      print("Build Completed");
      _getInitialVenues();
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
                stream: bloc.venues,
                builder: (context, AsyncSnapshot<VenuesList> snapshot) {
                  if (snapshot.hasData) {
                    return ListView(
                        children: List.generate(
                            snapshot.data!.venues.length,
                            (index) => AdminVenueCardWidget(
                                venue: snapshot.data!.venues[index])));
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else {
                    return const Center(child: Text('Нет площадок ...'));
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
