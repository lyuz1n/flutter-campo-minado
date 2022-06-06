import 'package:flutter/material.dart';
import 'package:flutter_campo_minado/src/app/app_controllers.dart';

abstract class AppInitialization {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    AppControllers.init();
  }
}
