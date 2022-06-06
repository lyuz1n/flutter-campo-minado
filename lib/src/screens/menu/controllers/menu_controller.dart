import 'package:flutter_campo_minado/src/utils/enums.dart';
import 'package:flutter_campo_minado/src/models/game_level_model.dart';
import 'package:homura/homura.dart';

class MenuController extends HomuraController {
  GameLevelList levels = [
    GameLevelModel(value: GameLevel.easy),
    GameLevelModel(value: GameLevel.medium),
    GameLevelModel(value: GameLevel.hard),
    GameLevelModel(value: GameLevel.veryhard),
    GameLevelModel(value: GameLevel.suicide),
  ];

  bool _cheatEnabled = false;

  bool get cheatEnabled => _cheatEnabled;

  void setCheatEnabled(bool? value) {
    _cheatEnabled = value ?? false;
    update();
  }
}
