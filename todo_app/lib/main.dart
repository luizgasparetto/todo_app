import 'package:dependency_module/dependency_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

//
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
