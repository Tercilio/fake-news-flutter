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
  late ColorScheme _colors;
  late ThemeData _theme;

  Widget get _loadingIndicator => Visibility(
        child: const LinearProgressIndicator(
          backgroundColor: Colors.blueGrey,
        ),
        visible: store.isLoading,
      );

  Widget get _firstname => Container(
        margin: const EdgeInsets.fromLTRB(25, 15, 25, 5),
        width: double.infinity,
        child: TextFormField(
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            // errorText: store.error.firstname,
            errorStyle: const TextStyle(fontWeight: FontWeight.bold),
            hintText: 'firstname_hint'.i18n(),
            prefixIcon: const Icon(Icons.person_rounded),
            contentPadding: const EdgeInsets.all(20),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 4.0),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          enabled: !store.isLoading,
          onChanged: (value) => store.firstname = value,
        ),
      );

  Widget get _email => Container(
        margin: const EdgeInsets.fromLTRB(25, 15, 25, 5),
        width: double.infinity,
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            // errorText: store.error.email,
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
            // errorText: store.error.password,
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

  Widget get _saveButton => Container(
      height: 56,
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(70, 15, 70, 5),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          ),
        ),
        onPressed: store.isLoading ? null : store.saveUser,
        child: Text('saveuser'.i18n()),
      ));

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
                          Modular.to.pushNamed('/');
                        },
              ),
            ])),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Sign Up')),
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
                  _firstname,
                  _email,
                  _password,
                  _saveButton,
                  _login,
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
