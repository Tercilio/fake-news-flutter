import 'package:basearch/src/features/auth/data/repository/user_repository.dart';
import 'package:basearch/src/features/auth/domain/repository/user_interface.dart';
import 'package:basearch/src/features/auth/domain/usecase/forgotpassword_usecase.dart';
import 'package:basearch/src/features/auth/domain/usecase/login_usecase.dart';
import 'package:basearch/src/features/auth/domain/usecase/signup_usecase.dart';
import 'package:basearch/src/features/auth/presentation/view/page/forgot_password_code_page.dart';
import 'package:basearch/src/features/auth/presentation/view/page/forgot_password_page.dart';
import 'package:basearch/src/features/auth/presentation/view/page/login_page.dart';
import 'package:basearch/src/features/auth/presentation/view/page/signup_page.dart';
import 'package:basearch/src/features/auth/presentation/view/page/validator_code_page.dart';
import 'package:basearch/src/features/auth/presentation/viewmodel/forgotpassword_viewmodel.dart';
import 'package:basearch/src/features/auth/presentation/viewmodel/forgotpasswordcode_viewmodel.dart';
import 'package:basearch/src/features/auth/presentation/viewmodel/login_viewmodel.dart';
import 'package:basearch/src/features/auth/presentation/viewmodel/signup_viewmodel.dart';
import 'package:basearch/src/features/auth/presentation/viewmodel/validatorcode_viewmodel.dart';
import 'package:basearch/src/features/main/data/repository/news_repository.dart';
import 'package:basearch/src/features/main/domain/repository/news_interface.dart';
import 'package:basearch/src/features/main/domain/usecase/news_usecase.dart';
import 'package:basearch/src/features/main/presentation/view/page/main_page.dart';
import 'package:basearch/src/features/main/presentation/viewmodel/main_viewmodel.dart';
import 'package:basearch/src/features/main/presentation/viewmodel/user_profile_viewmodel.dart';
import 'package:basearch/src/features/onboarding/presentation/view/page/onboarding_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/view/page/home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => LoginUseCase()),
        Bind.factory((i) => SignUpUseCase()),
        Bind.factory((i) => NewsUseCase()),
        Bind.factory((i) => ForgotPasswordUseCase()),
        Bind.factory((i) => ValidatorCodeViewModel()),
        Bind.factory((i) => LoginViewModel()),
        Bind.factory((i) => SignUpViewModel()),
        Bind.factory((i) => MainViewModel()),
        Bind.factory((i) => ForgotPasswordViewModel()),
        Bind.factory((i) => ForgotPasswordCodeViewModel()),
        Bind.factory((i) => UserProfileViewModel()),
        Bind.factory<IUser>((i) => UserRepository()),
        Bind.factory<INews>((i) => NewsRepository()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const HomePage()),
        ChildRoute('/login', child: (_, __) => const LoginPage()),
        ChildRoute('/signup', child: (_, __) => const SignUpPage()),
        ChildRoute('/main', child: (_, __) => const MainPage()),
        ChildRoute('/onboarding', child: (_, __) => const OnboardingPage()),
        ChildRoute('/forgotpassword', child: (_, __) => const ForgotPassword()),
        ChildRoute('/forgotpasswordcode',
            child: (_, __) => const ForgotPasswordCode()),
        ChildRoute('/validatorcode', child: (_, __) => const ValidatorCode()),
      ];
}
