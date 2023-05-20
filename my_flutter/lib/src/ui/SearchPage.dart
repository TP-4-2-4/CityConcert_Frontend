import 'package:flutter/material.dart';
import 'package:my_flutter/src/models/lists/events_list.dart';
import '../blocs/event_bloc.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Введите текст для поиска',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 14.0,
                          horizontal: 10.0,
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    _startSearch();
                  },
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Expanded(
                child: StreamBuilder(
              stream: bloc.events,
              builder: (context, AsyncSnapshot<EventsList> snapshot) {
                if (snapshot.hasData) {
                    return ListView( children: List.generate(
                        snapshot.data!.events.length,
                            (index) => ListTile(
                              //todo: change tile to card, but so far let it be
                              title: Text(snapshot.data!.events[index].name!),
                              subtitle: Text(snapshot.data!.events[index].startTime!),
                            )));

                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                return Center(child: CircularProgressIndicator());
              },
            )),
          ],
        ),
      ),
    );
  }
}
