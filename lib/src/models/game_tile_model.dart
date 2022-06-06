import 'package:flutter_campo_minado/src/utils/enums.dart';

typedef GameTileList = List<GameTileModel>;

class GameTileModel {
  GameTileModel({required this.type});

  final GameTileType type;
  bool revealed = false;

  bool get isMine => type == GameTileType.mine;
  bool get isDiamond => type == GameTileType.diamond;
}
