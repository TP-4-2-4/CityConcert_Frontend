import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:my_flutter/src/models/registration_model.dart';
import '../blocs/user_bloc.dart';
import 'custom_widgets/event_card.dart';
import 'home_page.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

  TextEditingController _loginController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordConfirmController = TextEditingController();
  TextEditingController _mailController = TextEditingController();

  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFF262626),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 175, 0, 0),
                    child: Text(
                      'Добро пожаловать!',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Color(0xFF9D9D9D),
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 8),
                  child: TextField(
                    style: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                    ),
                    controller: _loginController,
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Theme.of(context).primaryColorDark.withOpacity(0.6),
                      hintText: 'Введите логин',
                      hintStyle: TextStyle(color: Theme.of(context).primaryColorLight.withOpacity(0.3)),
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
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                  child: TextField(
                    style: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                    ),
                    controller: _passwordController,
                    cursorColor: Theme.of(context).primaryColor,
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      filled: true,

                      fillColor: Theme.of(context).primaryColorDark.withOpacity(0.6),
                      hintText: 'Введите пароль',
                      hintStyle: TextStyle(color: Theme.of(context).primaryColorLight.withOpacity(0.3)),
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
                      suffixIcon: IconButton(
                          icon: Icon(
                              _isObscure ? Icons.visibility : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });}
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                  child: TextField(
                    style: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                    ),
                    controller: _passwordConfirmController,
                    cursorColor: Theme.of(context).primaryColor,
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Theme.of(context).primaryColorDark.withOpacity(0.6),
                      hintText: 'Подтвердите пароль',
                      hintStyle: TextStyle(color: Theme.of(context).primaryColorLight.withOpacity(0.3)),
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
    suffixIcon: IconButton(
    icon: Icon(
    _isObscure ? Icons.visibility : Icons.visibility_off),
    onPressed: () {
    setState(() {
    _isObscure = !_isObscure;
    });}
    ),
    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 16),
                  child: TextField(
                    style: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                    ),
                    controller: _mailController,
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Theme.of(context).primaryColorDark.withOpacity(0.6),
                      hintText: 'Введите e-mail',
                      hintStyle: TextStyle(color: Theme.of(context).primaryColorLight.withOpacity(0.3)),
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
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 30, 16, 0),
                  child:  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                           signup();
                          },
                          style: flatroundedButtonStyle,
                          child: const Text('Зарегистрироваться'),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                  child: Text(
                    'Войти',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xFF9D9D9D),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                  child: Text(
                    'Войти как администратор',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xFF9D9D9D),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void>  signup() async {
    String login = _loginController.text;
    String password = _passwordController.text;
    String passwordConfirm = _passwordConfirmController.text;
    String email = _mailController.text;
    RegistrationModel newUser = RegistrationModel(username:login,email: email,
        password: password, passwordConfirm: passwordConfirm);
    bloc.registration(newUser);
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
  }
}
