import 'package:basearch/src/features/theme/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';

import 'app_module.dart';
import 'app_widget.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeChanger>(create: (_) => ThemeChanger())
      ],
      child: ModularApp(module: AppModule(), child: const AppWidget()),
    ),
  );
}
