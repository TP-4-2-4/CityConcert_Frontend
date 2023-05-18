import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_flutter/src/resources/util/ServerUrls.dart';
import '../models/event_model.dart';
import '../blocs/event_bloc.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  List<dynamic> searchResults = [];


  Future<void> _startSearch() async {
    String searchText = _searchController.text;
   bloc.fetchEventsByName(searchText);
    String apiUrl = '${ServerUrls.SERVER_URL}${ServerUrls.ADD_EVENT_URL}/$searchText';
    var response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonResults = jsonDecode(response.body);
      setState(() {
        searchResults = jsonResults;
      });
    } else {
      // Обработка ошибки API-вызова
      print('Ошибка при выполнении API-вызова: ${response.statusCode}');
    }
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
              child: ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  return ListTile( //todo: change tile to card, but so far let it be
                    title: Text(searchResults[index]['name']),
                    subtitle: Text(searchResults[index]['startTime']),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}