import 'package:flutter/material.dart';

import 'src/app/app_initialization.dart';
import 'src/app/app_widget.dart';

void main() async {
  await AppInitialization.init();
  runApp(const App());
}
