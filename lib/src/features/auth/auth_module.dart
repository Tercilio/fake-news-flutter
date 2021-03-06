import 'package:basearch/src/features/auth/domain/usecase/signup_usecase.dart';
import 'package:basearch/src/features/auth/presentation/view/page/forgot_password_code_page.dart';
import 'package:basearch/src/features/auth/presentation/view/page/validator_code_page.dart';
import 'package:basearch/src/features/auth/presentation/viewmodel/forgotpassword_viewmodel.dart';
import 'package:basearch/src/features/auth/presentation/viewmodel/forgotpasswordcode_viewmodel.dart';
import 'package:basearch/src/features/auth/presentation/viewmodel/signup_viewmodel.dart';
import 'package:basearch/src/features/auth/presentation/viewmodel/validatorcode_viewmodel.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../home/home_module.dart';
import 'data/repository/user_repository.dart';
import 'domain/repository/user_interface.dart';
import 'domain/usecase/forgotpassword_usecase.dart';
import 'domain/usecase/login_usecase.dart';
import 'presentation/view/page/forgot_password_page.dart';
import 'presentation/view/page/login_page.dart';
import 'presentation/view/page/signup_page.dart';
import 'presentation/viewmodel/login_viewmodel.dart';

class AuthModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => LoginViewModel()),
        Bind.factory((i) => SignUpViewModel()),
        Bind.factory((i) => ForgotPasswordViewModel()),
        Bind.factory((i) => ForgotPasswordCodeViewModel()),
        Bind.factory((i) => ValidatorCodeViewModel()),
        Bind.factory((i) => LoginUseCase()),
        Bind.factory((i) => SignUpUseCase()),
        Bind.factory((i) => ForgotPasswordUseCase()),
        Bind.factory<IUser>((i) => UserRepository()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/forgotpasswordcode',
            child: (_, __) => const ForgotPasswordCode()),
        ChildRoute('/forgotpassword', child: (_, __) => const ForgotPassword()),
        ChildRoute('/validatorcode', child: (_, __) => const ValidatorCode()),
        ChildRoute('/signup', child: (_, __) => const SignUpPage()),
        ChildRoute('/login', child: (_, __) => const LoginPage()),
        ModuleRoute('/', module: HomeModule())
      ];
}
