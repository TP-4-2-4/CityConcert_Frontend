import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../blocs/user_bloc.dart';
import '../../main.dart';
import '../custom_widgets/event_card.dart';

class AdminAccountPage extends StatefulWidget {
  @override
  _AdminAccountPageState createState() => _AdminAccountPageState();
}

class _AdminAccountPageState extends State<AdminAccountPage> {
  TextEditingController _adminloginController = TextEditingController();
  TextEditingController _adminemailController = TextEditingController();
  TextEditingController _adminpasswordController = TextEditingController();

  Future<void> _editAdminLogin() async {
    String login = _adminloginController.text;
  }

  Future<void> _editAdminPassword() async {
    String password = _adminpasswordController.text;
  }

  Future<void> _editAdminEmail() async {
    String email = _adminemailController.text;
  }

  void logout() async {
    bloc.logout();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => NavigationPage()));
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
                      controller: _adminloginController,
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
                  icon: const Icon(Icons.edit),
                  color: Theme.of(context).primaryColorLight,
                  onPressed: () {
                    _editAdminLogin();
                  },
                ),
              ],
            ),
            const SizedBox(height: 16.0),
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
                      controller: _adminemailController,
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
                  icon: const Icon(Icons.edit),
                  color: Theme.of(context).primaryColorLight,
                  onPressed: () {
                    _editAdminEmail();
                  },
                ),
              ],
            ),
            const SizedBox(height: 16.0),
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
                      controller: _adminpasswordController,
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
                  icon: const Icon(Icons.edit),
                  color: Theme.of(context).primaryColorLight,
                  onPressed: () {
                    _editAdminPassword();
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 25, 16, 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        logout();
                      },
                      style: flatroundedButtonStyleDark,
                      child: const Text('Выйти из аккаунта'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
