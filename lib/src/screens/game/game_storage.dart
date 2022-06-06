import 'package:flutter_campo_minado/src/models/game_tile_model.dart';

class GameStorage {
  GameStorage._();

  static final instance = GameStorage._();

  final GameTileList _tiles = [];

  int get maxTiles => 25;
  GameTileList get tiles => _tiles;

  void addTile(GameTileModel tile) {
    if (_tiles.length < maxTiles) {
      _tiles.add(tile);
    }
  }

  void shuffleTiles() {
    _tiles.shuffle();
  }

  void clear() {
    _tiles.clear();
  }

  GameTileList getRevealedTiles() {
    GameTileList tiles = [];

    for (final tile in _tiles) {
      if (tile.revealed) {
        tiles.add(tile);
      }
    }

    return tiles;
  }
}
