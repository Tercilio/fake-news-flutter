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

  Widget get _logo => Container(
      margin: const EdgeInsets.fromLTRB(25, 15, 25, 5),
      width: double.infinity,
      child: Column(
        children: const [
          Image(
            image: AssetImage('lib/assets/images/logo.png'),
            height: 140,
          ),
          Image(
            image: AssetImage('lib/assets/images/removebg_blue.png'),
            height: 55,
          )
        ],
      ));

  Widget get _loadingIndicator => Visibility(
        child: const LinearProgressIndicator(
          backgroundColor: Colors.blueGrey,
        ),
        visible: store.isLoading,
      );

  Widget get _email => Container(
        margin: const EdgeInsets.fromLTRB(25, 15, 25, 5),
        width: double.infinity,
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            errorText: store.error.email,
            errorStyle: const TextStyle(fontWeight: FontWeight.bold),
            hintText: 'email_hint'.i18n(),
            prefixIcon: const Icon(Icons.email_rounded),
            contentPadding: const EdgeInsets.all(20),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 4.0),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          enabled: !store.isLoading,
          onChanged: (value) => store.email = value,
        ),
      );

  Widget get _password => Container(
        margin: const EdgeInsets.fromLTRB(25, 15, 25, 5),
        width: double.infinity,
        child: TextFormField(
          obscureText: true,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            errorText: store.error.password,
            errorStyle: const TextStyle(fontWeight: FontWeight.bold),
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
                borderRadius: BorderRadius.circular(40),
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
                  _logo,
                  _loadingIndicator,
                  _email,
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
