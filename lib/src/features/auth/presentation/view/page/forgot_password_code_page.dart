import 'package:basearch/src/features/auth/presentation/viewmodel/forgotpasswordcode_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

class ForgotPasswordCode extends StatefulWidget {
  const ForgotPasswordCode({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordCode> createState() => _ForgotPasswordCodeState();
}

class _ForgotPasswordCodeState
    extends ModularState<ForgotPasswordCode, ForgotPasswordCodeViewModel> {
  late ColorScheme _colors;
  late ThemeData _theme;

  Widget get _logo => Container(
      margin: const EdgeInsets.fromLTRB(25, 15, 25, 5),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage('lib/assets/images/password.png'),
            height: 80,
          ),
          Text(
            'forgot_password_code'.i18n(),
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

  Widget get _code => Container(
        margin: const EdgeInsets.fromLTRB(25, 15, 25, 5),
        width: double.infinity,
        //height: 56,
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            errorText: store.error.code,
            hintText: 'insert_code_hint'.i18n(),
            prefixIcon: const Icon(Icons.person),
            contentPadding: const EdgeInsets.all(20),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 4.0),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          enabled: !store.isLoading,
          onChanged: (value) => store.code = value,
        ),
      );

  Widget get _continueButton => Container(
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
                  if (store.error.code != null) {
                    store.sendEmail();
                  } else {
                    Navigator.pop(context);
                    Modular.to.pushNamed('/validatorcode');
                  }
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
                  _code,
                  _continueButton,
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
