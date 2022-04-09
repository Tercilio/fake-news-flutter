import 'package:basearch/src/features/auth/presentation/viewmodel/validatorcode_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

class ValidatorCode extends StatefulWidget {
  const ValidatorCode({Key? key}) : super(key: key);

  @override
  State<ValidatorCode> createState() => _validatorCodeState();
}

class _validatorCodeState
    extends ModularState<ValidatorCode, ValidatorCodeViewModel> {
  late ColorScheme _colors;
  late ThemeData _theme;

Widget get _logo => Container(
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

  Widget get _loadingIndicator => Visibility(
        child: const LinearProgressIndicator(
          backgroundColor: Colors.blueGrey,
        ),
        visible: store.isLoading,
      );

  Widget get _newPassword => Container(
        margin: const EdgeInsets.fromLTRB(25, 15, 25, 5),
        width: double.infinity,
        //height: 56,
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            //errorText: store.error.username,
            hintText: 'new_password_hint'.i18n(),
            prefixIcon: const Icon(Icons.person),
            contentPadding: const EdgeInsets.all(20),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 4.0),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          enabled: !store.isLoading,
          onChanged: (value) => store.password = value,
        ),
      );

      Widget get _confirmNewPassword => Container(
        margin: const EdgeInsets.fromLTRB(25, 15, 25, 5),
        width: double.infinity,
        //height: 56,
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            //errorText: store.error.username,
            hintText: 'new_password_confirm_hint'.i18n(),
            prefixIcon: const Icon(Icons.person),
            contentPadding: const EdgeInsets.all(20),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 4.0),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          enabled: !store.isLoading,
          onChanged: (value) => store.confirmePassword = value,
        ),
      );

  Widget get _changeButton => Container(
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
          onPressed: store.isLoading
              ? null
              : () {
                  Navigator.pop(context);
                  Modular.to.pushNamed('/');
                },
          child: Text('continue'.i18n()),
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
                  _logo,
                  _newPassword,
                  _confirmNewPassword,
                  _changeButton,
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
