import 'package:flutter_campo_minado/src/utils/enums.dart';

typedef GameLevelList = List<GameLevelModel>;

class GameLevelModel {
  GameLevelModel({required this.value});

  final GameLevel value;

  @override
  String toString() {
    switch (value) {
      case GameLevel.easy:
        return 'Fácil';
      case GameLevel.medium:
        return 'Médio';
      case GameLevel.hard:
        return 'Difícil';
      case GameLevel.veryhard:
        return 'Cabuloso';
      case GameLevel.suicide:
        return 'Suicídio';
    }
  }

  int get mines {
    switch (value) {
      case GameLevel.easy:
        return 1;
      case GameLevel.medium:
        return 3;
      case GameLevel.hard:
        return 5;
      case GameLevel.veryhard:
        return 7;
      case GameLevel.suicide:
        return 24;
    }
  }
}
