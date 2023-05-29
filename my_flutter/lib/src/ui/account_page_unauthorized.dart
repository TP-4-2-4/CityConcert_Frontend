import 'package:flutter/material.dart';

import 'package:my_flutter/src/models/registration_model.dart';
import '../blocs/user_bloc.dart';
import '../resources/repositories/authentication_repository.dart';
import 'custom_widgets/event_card.dart';
import 'home_page.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  TextEditingController mailController = TextEditingController();

  bool showSignUp = false;
  bool showSignIn = true;
  bool showSignInAdmin = false;

  late final AuthenticationRepository _authenticationRepository;
  @override
  void initState() {
    super.initState();
    _authenticationRepository = AuthenticationRepository();
  }

  @override
  void dispose() {
    _authenticationRepository.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: SingleChildScrollView(
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
                if (showSignIn & !showSignUp & !showSignInAdmin) ...[
                  LoginField(controller: loginController),
                  PasswordField(
                      controller: passwordController,
                      hintText: 'Введите пароль'),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 25, 16, 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                             signIn();
                            },
                            style: flatroundedButtonStyle,
                            child: const Text('Войти'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 25, 16, 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                //does not call signin func but redraws interface
                                showSignIn = false;
                                showSignUp = true;
                                showSignInAdmin = false;
                              });
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              minimumSize: const Size(100, 50),
                            ),
                            child: Text(
                              'Зарегистрироваться',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColorLight),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 25, 16, 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                showSignIn = false;
                                showSignUp = false;
                                showSignInAdmin = true;
                              });
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              minimumSize: const Size(100, 50),
                            ),
                            child: Text(
                              'Войти как администратор',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColorLight),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                if (showSignUp && !showSignIn && !showSignInAdmin) ...[
                  LoginField(controller: loginController),
                  PasswordField(
                      controller: passwordController,
                      hintText: 'Введите пароль'),
                  PasswordField(
                      controller: passwordConfirmController,
                      hintText: 'Повторите пароль'),
                  EmailField(controller: mailController),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 25, 16, 8),
                    child: Row(
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
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 25, 16, 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                showSignIn = true;
                                showSignUp = false;
                                showSignInAdmin = false;
                              });
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              minimumSize: const Size(100, 50),
                            ),
                            child: Text(
                              'Войти',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColorLight),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 25, 16, 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                showSignIn = false;
                                showSignUp = false;
                                showSignInAdmin = true;
                              });
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              minimumSize: const Size(100, 50),
                            ),
                            child: Text(
                              'Войти как администратор',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColorLight),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                if (showSignInAdmin && !showSignIn && !showSignUp) ...[
                  LoginField(controller: loginController),
                  PasswordField(
                      controller: passwordController,
                      hintText: 'Введите пароль'),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 25, 16, 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                             },
                            style: flatroundedButtonStyle,
                            child: const Text('Войти'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 25, 16, 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                showSignIn = true;
                                showSignUp = false;
                                showSignInAdmin = false;
                              });
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              minimumSize: const Size(100, 50),
                            ),
                            child: Text(
                              'Войти',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColorLight),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 25, 16, 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                showSignIn = false;
                                showSignUp = true;
                                showSignInAdmin = false;
                              });
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              minimumSize: const Size(100, 50),
                            ),
                            child: Text(
                              'Зарегистрироваться',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColorLight),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> signup() async {
    String login = loginController.text;
    String password = passwordController.text;
    String passwordConfirm = passwordConfirmController.text;
    String email = mailController.text;
    RegistrationModel newUser = RegistrationModel(
        username: login,
        email: email,
        password: password,
        passwordConfirm: passwordConfirm);
    bloc.registration(newUser);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
  }

  void signIn() async{}
}

class LoginField extends StatefulWidget {
  final TextEditingController controller;

  const LoginField({super.key, required this.controller});

  @override
  _LoginFieldState createState() => _LoginFieldState();
}

class _LoginFieldState extends State<LoginField> {
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
          hintText: 'Введите логин',
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

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;

  const PasswordField(
      {super.key, required this.controller, required this.hintText});

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
      child: TextField(
        style: TextStyle(
          color: Theme.of(context).primaryColorLight,
        ),
        controller: widget.controller,
        cursorColor: Theme.of(context).primaryColor,
        obscureText: isObscure,
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
          suffixIcon: IconButton(
              icon: Icon(isObscure ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                isObscure = !isObscure;
              }),
        ),
      ),
    );
  }
}

class EmailField extends StatefulWidget {
  final TextEditingController controller;

  const EmailField({super.key, required this.controller});

  @override
  _EmailFieldState createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 16),
      child: TextField(
        style: TextStyle(
          color: Theme.of(context).primaryColorLight,
        ),
        controller: widget.controller,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          filled: true,
          fillColor: Theme.of(context).primaryColorDark.withOpacity(0.6),
          hintText: 'Введите e-mail',
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
