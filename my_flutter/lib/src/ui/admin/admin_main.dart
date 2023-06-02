import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'admin_account_page.dart';
import 'admin_events_page.dart';
import 'admin_search_page.dart';
import 'admin_venues_page.dart';

class NavigationPageAdmin extends StatefulWidget {
  @override
  _NavigationPageAdminState createState() => _NavigationPageAdminState();
}

class _NavigationPageAdminState extends State<NavigationPageAdmin> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    AdminEventsPage(),
    AdminVenuesPage(),
    AdminSearchPage(),
    AdminAccountPage()
  ];
  final List<Widget> _appbarText = [
    Text('Список мероприятий'),
    Text('Список площадок'),
    Text('Поиск'),
    Text('Администратор')
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _appbarText[_selectedIndex],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: BottomNavigationBar(
            backgroundColor:
                Theme.of(context).primaryColorDark.withOpacity(0.3),
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            fixedColor: Theme.of(context).primaryColorLight,
            unselectedItemColor: Theme.of(context).primaryColorDark,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.list),
                label: 'Events',
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.locationPin),
                label: 'Venues',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.userGroup),
                label: 'Account',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
