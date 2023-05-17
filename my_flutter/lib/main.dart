import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_flutter/SearchPage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(),
      ),
      home: const NavigationPage(),
    );
  }
}

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [HomePage(), RecsPage(),
    SearchPage(), TicketsPage(), AccountPage()];
  final List<Widget> _appbarText = [const Text('Home'), const Text('Recommendations'),
    const Text('Search'), const Text('My tickets'), const Text('Account')];

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
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0), // Радиус скругления краев
          child: BottomNavigationBar(
            backgroundColor: Colors.pink,
            type: BottomNavigationBarType.fixed, // Отменяем анимацию навбара
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
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.list),
                label: 'Recs',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.ticket),
                label: 'Tickets',
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.user),
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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Home Page'),
    );
  }
}

class RecsPage extends StatelessWidget {
  const RecsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Recs Page'),
    );
  }
}

class TicketsPage extends StatelessWidget {
  const TicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Tickets Page'),
    );
  }
}
class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Account Page'),
    );
  }
}
