import 'package:flutter/material.dart';
import 'package:flutter_campo_minado/src/utils/colors.dart';

import '../../../../models/game_tile_model.dart';

class GameTile extends StatelessWidget {
  const GameTile({Key? key, required this.tile, this.reveal = true, this.onTurn}) : super(key: key);

  final GameTileModel tile;
  final bool reveal;
  final void Function(GameTileModel)? onTurn;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Stack(
        children: [
          if (tile.revealed) ...[
            Container(
              color: tile.isMine ? AppColors.mineBackground : Colors.transparent,
            ),
            Center(
              child: Text(
                tile.isDiamond ? '💎' : '💣',
                style: const TextStyle(
                  fontSize: 32,
                ),
              ),
            ),
          ] else ...[
            Positioned.fill(
              child: Material(
                color: tile.revealed
                    ? Colors.transparent
                    : tile.isMine && reveal
                        ? AppColors.mineBackground
                        : AppColors.bar,
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.white10,
                  onTap: () {
                    tile.revealed = true;
                    onTurn?.call(tile);
                  },
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
