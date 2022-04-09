import 'package:basearch/src/features/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'features/auth/auth_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: HomeModule()),
      ];
}
