import 'package:flutter/material.dart';
import 'package:my_flutter/src/ui/admin/custom_widgets_admin/admin_event_card.dart';

import '../../blocs/event_bloc.dart';
import '../../models/lists/events_list.dart';

class AdminSearchPage extends StatefulWidget {
  @override
  _AdminSearchPageState createState() => _AdminSearchPageState();
}

class _AdminSearchPageState extends State<AdminSearchPage> {
  TextEditingController _searchController = TextEditingController();

  Stream<EventsList> searchResults = bloc.events;

  Future<void> _startSearch() async {
    String searchText = _searchController.text;
    bloc.fetchEventsByName(searchText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: TextField(
                      style: TextStyle(
                        color: Theme.of(context).primaryColorLight,
                      ),
                      controller: _searchController,
                      cursorColor: Theme.of(context).primaryColor,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black54,
                        hintText: 'Введите текст для поиска',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 14.0,
                          horizontal: 10.0,
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    _startSearch();
                  },
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
                }
                return const Center(child: Text('Здесь пока ничего нет ...'));
              },
            )),
          ],
        ),
      ),
    );
  }
}
