import 'package:flutter_campo_minado/src/screens/game/controllers/game_controller.dart';
import 'package:flutter_campo_minado/src/screens/menu/controllers/menu_controller.dart';
import 'package:homura/homura.dart';

abstract class AppControllers {
  static void init() {
    Homura.put(MenuController());
    Homura.put(GameController());
  }
}
