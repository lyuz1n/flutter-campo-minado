import 'package:flutter/material.dart';
import 'package:flutter_campo_minado/src/utils/enums.dart';
import 'package:flutter_campo_minado/src/models/game_level_model.dart';
import 'package:flutter_campo_minado/src/models/game_tile_model.dart';
import 'package:flutter_campo_minado/src/screens/game/game_storage.dart';
import 'package:homura/homura.dart';

class GameController extends HomuraController {
  GameState _gameState = GameState.idle;
  late GameLevelModel _gameLevel;

  bool get idle => _gameState == GameState.idle;
  bool get playing => _gameState == GameState.playing;
  bool get win => _gameState == GameState.win;
  bool get lose => _gameState == GameState.lose;
  bool get finished => win || lose;

  GameStorage get storage => GameStorage.instance;

  @override
  void onInit() {
    super.onInit();
    _gameState = GameState.idle;
    _gameLevel = GameLevelModel(value: GameLevel.easy);
  }

  @override
  void onReady() {
    super.onReady();
    generateTiles();
    setGameState(GameState.playing);
  }

  void restart() {
    _gameState = GameState.idle;
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      generateTiles();
      setGameState(GameState.playing);
    });
  }

  void setGameState(GameState gameState) {
    if (_gameState == gameState) return;

    _gameState = gameState;
    update();
  }

  void setGameLevel(GameLevelModel gameLevel) {
    _gameLevel = gameLevel;
  }

  void generateTiles() {
    storage.clear();

    final tilesCount = storage.maxTiles;
    for (int i = 1; i <= tilesCount; i++) {
      final diamondsCount = tilesCount - _gameLevel.mines;
      storage.addTile(GameTileModel(type: i <= diamondsCount ? GameTileType.diamond : GameTileType.mine));
    }

    storage.shuffleTiles();
  }

  void onTurn(GameTileModel tile) {
    if (_gameState != GameState.playing) return;

    update();

    if (!_checkLose(tile)) {
      _checkWin();
    }
  }

  bool _checkLose(GameTileModel tile) {
    if (tile.isMine) {
      for (final tile in storage.tiles) {
        tile.revealed = true;
      }
      setGameState(GameState.lose);
      return true;
    }
    return false;
  }

  void _checkWin() {
    bool win = true;
    for (final tile in storage.tiles) {
      if (!tile.revealed && tile.isDiamond) {
        win = false;
        break;
      }
    }

    if (win) {
      setGameState(GameState.win);
    }
  }
}
