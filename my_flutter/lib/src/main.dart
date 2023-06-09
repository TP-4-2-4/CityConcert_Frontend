import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_flutter/src/ui/SearchPage.dart';
import 'package:my_flutter/src/ui/account_page_unauthorized.dart';
import 'package:my_flutter/src/ui/admin/admin_main.dart';
import 'package:my_flutter/src/ui/company/company_search.dart';
import 'package:my_flutter/src/ui/exchange/exchange_search.dart';
import 'package:my_flutter/src/ui/home_page.dart';
import 'package:my_flutter/src/ui/recommendations_page.dart';
import 'package:my_flutter/src/ui/splash_screen.dart';
import 'package:my_flutter/src/ui/tickets_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final darkTheme = ThemeData(
      primaryColor: const Color.fromRGBO(252, 23, 229, 1), // Новый primary color
      primaryColorDark: const Color.fromRGBO(19, 19, 19, 1),
      primaryColorLight: const Color.fromRGBO(157, 157, 157, 1),
      canvasColor: const Color.fromRGBO(38, 38, 38, 1),
      textTheme: const TextTheme(
        // Новые стили текста style: Theme.of(context).textTheme.titleLarge
        titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
    return MaterialApp(
      title: 'My App',
      theme: darkTheme,
        //colorScheme: const ColorScheme.dark(),
      home: SplashScreen(),
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/NavigationPage': (context) => const NavigationPage(),
        '/NavigationPageAdmin': (context) => NavigationPageAdmin(),
        '/Exchanges': (context) => const SearchExchangeWidget(),
        '/Company': (context) => const SearchCompanyWidget(),
        // When navigating to the "/second" route, build the SecondScreen widget.
      },
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
  final List<Widget> _pages = [HomePage(), RecommendationsPage(),
    SearchPage(), TicketsWidget(), AccountPage()];
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
        backgroundColor: Theme.of(context).canvasColor,
      ),
      body: _pages[_selectedIndex],

      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16.0), // Устанавливаем отступы
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0), // Радиус скругления краев
          child: BottomNavigationBar(
            backgroundColor: Theme.of(context).primaryColor,
            type: BottomNavigationBarType.fixed, // Отменяем анимацию навбара
            elevation: 0, // Устанавливаем значение elevation на 0, чтобы убрать тень
            fixedColor: Theme.of(context).primaryColorDark, // Устанавливаем цвет активной кнопки
            unselectedItemColor: Theme.of(context).canvasColor.withOpacity(0.4), // Устанавливаем цвет неактивных кнопок
            showSelectedLabels: false, // Устанавливаем значение false, чтобы скрыть выбранные метки
            showUnselectedLabels: false, // Устанавливаем значение false, чтобы скрыть не выбранные метки
            items: const [
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.house, size: 20,),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.boltLightning, size: 20),
                label: 'Recs',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search_rounded),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.ticket),
                label: 'Tickets',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_rounded),
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