import 'package:basearch/src/features/auth/auth_module.dart';
import 'package:basearch/src/features/auth/data/repository/login_repository.dart';
import 'package:basearch/src/features/auth/domain/repository/login_interface.dart';
import 'package:basearch/src/features/auth/domain/usecase/login_usecase.dart';
import 'package:basearch/src/features/auth/domain/usecase/signup_usecase.dart';
import 'package:basearch/src/features/auth/presentation/view/page/login_page.dart';
import 'package:basearch/src/features/auth/presentation/view/page/signup_page.dart';
import 'package:basearch/src/features/auth/presentation/viewmodel/login_viewmodel.dart';
import 'package:basearch/src/features/auth/presentation/viewmodel/signup_viewmodel.dart';
import 'package:basearch/src/features/onboarding/presentation/view/page/onboarding_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/view/page/home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => LoginUseCase()),
        Bind.factory((i) => SignUpUseCase()),
        Bind.factory((i) => LoginViewModel()),
        Bind.factory((i) => SignUpViewModel()),
        Bind.factory<ILogin>((i) => LoginRepository()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const HomePage()),
        ChildRoute('/login', child: (_, __) => const LoginPage()),
        ChildRoute('/signup', child: (_, __) => const SignUpPage()),
        ChildRoute('/onboarding', child: (_, __) => const OnboardingPage()),
      ];
}
