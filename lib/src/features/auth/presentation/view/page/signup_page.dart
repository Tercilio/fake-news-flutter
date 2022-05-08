import 'dart:async';

import 'package:basearch/src/features/auth/presentation/view/page/login_page.dart';
import 'package:basearch/src/features/auth/presentation/viewmodel/signup_viewmodel.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ModularState<SignUpPage, SignUpViewModel> {
  late bool isAccountCreated = false;
  late ColorScheme _colors;
  late ThemeData _theme;

  Widget get _logoSignUp => Container(
      margin: const EdgeInsets.fromLTRB(25, 15, 25, 5),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage('lib/assets/images/signup.png'),
            height: 80,
          ),
          Text(
            'signup'.i18n(),
            style: const TextStyle(fontSize: 28, color: Colors.black87),
            textAlign: TextAlign.center,
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

  Widget get _fullname => Container(
        margin: const EdgeInsets.fromLTRB(25, 15, 25, 5),
        width: double.infinity,
        child: TextFormField(
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            errorText: store.error.fullname,
            errorStyle: const TextStyle(fontWeight: FontWeight.bold),
            hintText: 'fullname_hint'.i18n(),
            prefixIcon: const Icon(Icons.person_rounded),
            contentPadding: const EdgeInsets.all(20),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 4.0),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          enabled: !store.isLoading,
          onChanged: (value) => store.fullname = value,
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

  Widget get _birthdate => Container(
        margin: const EdgeInsets.fromLTRB(25, 15, 25, 5),
        width: double.infinity,
        child: TextFormField(
          key: Key(store.birthdate),
          initialValue: store.birthdate,
          decoration: InputDecoration(
            errorText: store.error.birthdate,
            errorStyle: const TextStyle(fontWeight: FontWeight.bold),
            hintText: 'birthdate_hint'.i18n(),
            prefixIcon: const Icon(Icons.date_range_rounded),
            contentPadding: const EdgeInsets.all(20),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 4.0),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          enabled: !store.isLoading,
          onTap: () async {
            final dataPick = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime.now());
            if (dataPick != null && dataPick != store.birthdate) {
              setState(() {
                store.isDateSelected = true;
                store.birthdate =
                    dataPick.toString().replaceAll('-', '/').substring(0, 10);
              });
            }
          },
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

  Widget get _saveButton => Center(
        child: Column(
          children: [
            Visibility(
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 15, 0, 5),
                child: Text(
                  'singup_success'.i18n(),
                  style: const TextStyle(color: Colors.green, fontSize: 18),
                ),
              ),
              visible: store.error.signup.isEmpty && isAccountCreated,
            ),
            Visibility(
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 15, 0, 5),
                child: Text(
                  store.error.signup,
                  style: const TextStyle(color: Colors.red, fontSize: 18),
                ),
              ),
              visible: store.error.signup.isNotEmpty,
            ),
            Visibility(
              child: Container(
                height: 56,
                margin: const EdgeInsets.fromLTRB(0, 15, 0, 5),
                child: ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(180, 56)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                    ),
                  ),
                  onPressed: () async {
                    isAccountCreated = await store.singup();

                    if (isAccountCreated) {
                      startTime();
                    }
                  },
                  child: Text('saveuser'.i18n()),
                ),
              ),
              visible: !isAccountCreated,
            ),
          ],
        ),
      );

  Widget get _login => Container(
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(30, 15, 30, 5),
        child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              TextSpan(
                  text: 'questionlogin_text'.i18n(),
                  style: const TextStyle(color: Colors.grey)),
              TextSpan(
                text: 'login'.i18n(),
                style: const TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = store.isLoading
                      ? null
                      : () {
                          Navigator.pop(context);
                          Modular.to.pushNamed('/login');
                        },
              ),
            ])),
      );

  @override
  Widget build(BuildContext context) {
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
                  _logoSignUp,
                  _fullname,
                  _birthdate,
                  _email,
                  _password,
                  store.isLoading ? _loadingIndicator : _saveButton,
                  _login,
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  startTime() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, route);
  }

  route() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }
}
