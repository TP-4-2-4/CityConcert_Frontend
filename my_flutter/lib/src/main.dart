import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_flutter/src/ui/SearchPage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        colorScheme: ColorScheme.dark(),
      ),
      home: NavigationPage(),
    );
  }
}

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;
  List<Widget> _pages = [HomePage(), SearchPage(), AccountPage()];
  List<Widget> _allpages = [HomePage(), RecsPage(), SearchPage(), TicketsPage(), AccountPage()];
  List<Widget> _appbarText = [Text('Home'), Text('Search'), Text('Account')];
  List<Widget> _allappbarText = [Text('Home'), Text('Reccommendations'),
    Text('Search'), Text('My tickets'), Text('Account')];

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
        margin: const EdgeInsets.all(16.0), // Устанавливаем отступы
        decoration: BoxDecoration(
          color: Colors.pinkAccent, // Цвет фона навигационной панели
          borderRadius: BorderRadius.circular(30.0), // Радиус скругления краев
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0, // Устанавливаем значение elevation на 0, чтобы убрать тень
          fixedColor: Colors.black, // Устанавливаем цвет активной кнопки
          unselectedItemColor: Colors.black26, // Устанавливаем цвет неактивных кнопок
          showSelectedLabels: false, // Устанавливаем значение false, чтобы скрыть выбранные метки
          showUnselectedLabels: false, // Устанавливаем значение false, чтобы скрыть не выбранные метки
          items: const [
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.house),
              label: 'Home',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(FontAwesomeIcons.list),
            //   label: 'Recs',
            // ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(FontAwesomeIcons.ticket),
            //   label: 'Tickets',
            // ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.user),
              label: 'Account',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home Page'),
    );
  }
}

class RecsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Recs Page'),
    );
  }
}

class TicketsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Tickets Page'),
    );
  }
}
class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Account Page'),
    );
  }
}
