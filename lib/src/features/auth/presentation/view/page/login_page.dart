import 'package:basearch/src/common/form_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

import '../../viewmodel/login_viewmodel.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginViewModel> {
  late ColorScheme _colors;
  late ThemeData _theme;

  Widget get _loadingIndicator => Visibility(
        child: const LinearProgressIndicator(
          backgroundColor: Colors.blueGrey,
        ),
        visible: store.isLoading,
      );

  Widget get _username => Container(
        margin: const EdgeInsets.fromLTRB(25, 15, 25, 5),
        width: double.infinity,
        height: 56,
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            errorText: store.error.username,
            hintText: 'username_hint'.i18n(),
            prefixIcon: const Icon(Icons.person),
            contentPadding: const EdgeInsets.all(20),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 4.0),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          enabled: !store.isLoading,
          onChanged: (value) => store.username = value,
        ),
      );

  Widget get _password => Container(
        margin: const EdgeInsets.fromLTRB(25, 15, 25, 5),
        width: double.infinity,
        height: 56,
        child: TextFormField(
          obscureText: true,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            errorText: store.error.password,
            hintText: 'password_hint'.i18n(),
            contentPadding: const EdgeInsets.all(20),
            prefixIcon: const Icon(Icons.lock_rounded),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 4.0),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          enabled: !store.isLoading,
          onChanged: (value) => store.password = value,
        ),
      );

  Widget get _loginButton => Container(
        height: 56,
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(70, 15, 70, 5),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
          onPressed: store.isLoading ? null : store.login,
          child: Text('login'.i18n()),
        ),
      );

  Widget get _forgotPassword => Container(
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: TextButton(
          style: TextButton.styleFrom(
              splashFactory: NoSplash.splashFactory, primary: Colors.grey),
          onPressed: store.isLoading
              ? null
              : () {
                  Navigator.pop(context);
                  Modular.to.pushNamed('/forgotpassword');
                },
          child: Text('forgot_password'.i18n()),
        ),
      );

  Widget get _signUp => Container(
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: TextButton(
          style: TextButton.styleFrom(
              splashFactory: NoSplash.splashFactory, primary: Colors.grey),
          onPressed: store.isLoading
              ? null
              : () {
                  Navigator.pop(context);
                  Modular.to.pushNamed('/signup');
                },
          child: Text('signup'.i18n()),
        ),
      );

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    _colors = _theme.colorScheme;

    return Scaffold(
      // appBar: AppBar(title: const Text('Login')),
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SingleChildScrollView(
          child: Observer(builder: (_) {
            return Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  _loadingIndicator,
                  const SizedBox(height: 5),
                  _username,
                  _password,
                  _loginButton,
                  _forgotPassword,
                  _signUp
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
