import 'package:basearch/src/common/form_text_field.dart';
import 'package:basearch/src/features/auth/presentation/viewmodel/forgotpassword_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:flutter/material.dart';
import '../../viewmodel/login_viewmodel.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState
    extends ModularState<ForgotPassword, ForgotPasswordViewModel> {
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
        //height: 56,
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            //errorText: store.error.username,
            hintText: 'reset_password_hint'.i18n(),
            prefixIcon: const Icon(Icons.person),
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

      Widget get _cpf => Container(
        margin: const EdgeInsets.fromLTRB(25, 15, 25, 5),
        width: double.infinity,
        //height: 56,
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            //errorText: store.error.username,
            hintText: 'cpf_hint'.i18n(),
            prefixIcon: const Icon(Icons.person),
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

  Widget get _forgotButton => Container(
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
          onPressed: store.isLoading ? null : store.send,
          child: Text('send_email'.i18n()),
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
                   _cpf,
                  _forgotButton,
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
