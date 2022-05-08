import 'package:basearch/src/features/auth/presentation/view/page/forgot_password_page.dart';
import 'package:basearch/src/features/main/presentation/view/page/main_page.dart';
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

  Widget get _loadingIndicator => Container(
        height: 56,
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(70, 15, 70, 5),
        child: const Center(
          child: Visibility(
            child: CircularProgressIndicator(
              backgroundColor: Colors.blueGrey,
            ),
          ),
        ),
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
        margin: const EdgeInsets.fromLTRB(25, 15, 25, 0),
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
        margin: const EdgeInsets.fromLTRB(0, 15, 0, 5),
        child: Center(
          child: ElevatedButton(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(const Size(180, 56)),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
              ),
            ),
            onPressed: () async {
              store.login();

              if (store.isLogged && !store.isLoading) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const MainPage(),
                  ),
                );
              }
            },
            child: Text('login'.i18n()),
          ),
        ),
      );

  Widget get _loginTextError => Container(
        margin: const EdgeInsets.only(top: 15),
        child: Center(
          child: Visibility(
            child: Text(
              store.error.login,
              style: const TextStyle(color: Colors.red, fontSize: 14),
            ),
            visible: store.error.login.isNotEmpty,
          ),
        ),
      );

  Widget get _forgotPassword => Container(
        margin: const EdgeInsets.only(right: 25),
        padding: const EdgeInsets.only(top: 10.0),
        child: Align(
          alignment: Alignment.topRight,
          child: InkWell(
            child: Text(
              'forgot_password'.i18n(),
              style: const TextStyle(
                fontWeight: FontWeight.w100,
                color: Colors.grey,
              ),
            ),
            onTap: () => store.isLoading
                ? null
                : Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ForgotPassword(),
                    ),
                  ),
          ),
        ),
      );

  Widget get _signUp => Center(
        child: TextButton(
          style: TextButton.styleFrom(
            splashFactory: NoSplash.splashFactory,
            primary: Colors.grey,
          ),
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
                  _email,
                  _password,
                  _forgotPassword,
                  _loginTextError,
                  store.isLoading ? _loadingIndicator : _loginButton,
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
