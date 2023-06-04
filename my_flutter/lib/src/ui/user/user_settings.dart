import 'package:flutter/material.dart';
import 'package:my_flutter/src/blocs/user_bloc.dart';

import '../../main.dart';
import '../../models/user_model.dart';
import '../custom_widgets/event_card.dart';

class UserSettingsPage extends StatefulWidget {
  final UserModel user;
  const UserSettingsPage({Key? key, required this.user});
  @override
  _UserSettingsPageState createState() => _UserSettingsPageState();
}

class _UserSettingsPageState extends State<UserSettingsPage> {
  TextEditingController _userPictureController = TextEditingController();
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _userPasswordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Theme.of(context).primaryColor,
            size: 30,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: const Align(
          alignment: AlignmentDirectional(-0.6, 0),
          child: Text(
            'Настройки',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            InputField(
                controller: _userPictureController,
                hintText: 'user picture'),
            InputField(
                controller: _userNameController,
                hintText: widget.user.username!),
            InputField(
                controller: _userEmailController,
                hintText: widget.user.email!),
            InputField(
                controller: _userPasswordController,
                hintText: widget.user.password!),
            Row(children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 16),
                  child: TextButton(
                    onPressed: () async {
                      bloc.logout();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NavigationPage(),
                        ),
                      );
                    },
                    style: flatroundedButtonStyleDark,
                    child: const Text(
                      'Выйти из аккаунта',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

class InputField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;

  const InputField(
      {super.key, required this.controller, required this.hintText});

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 8),
      child: TextField(
        style: TextStyle(
          color: Theme.of(context).primaryColorLight,
        ),
        controller: widget.controller,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          filled: true,
          fillColor: Theme.of(context).primaryColorDark.withOpacity(0.6),
          hintText: widget.hintText,
          hintStyle: TextStyle(
              color: Theme.of(context).primaryColorLight.withOpacity(0.3)),
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
    );
  }
}