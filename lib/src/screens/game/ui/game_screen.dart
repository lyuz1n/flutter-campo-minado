import 'package:flutter/material.dart';
import 'package:flutter_campo_minado/src/utils/colors.dart';
import 'package:flutter_campo_minado/src/models/game_level_model.dart';
import 'package:flutter_campo_minado/src/screens/game/game_storage.dart';
import 'package:flutter_campo_minado/src/screens/game/ui/widgets/game_tile.dart';
import 'package:homura/homura.dart';

import '../controllers/game_controller.dart';

class GameScreen extends HomuraView<GameController> {
  const GameScreen({Key? key, required this.gameLevel, this.cheatEnabled = false}) : super(key: key);

  final GameLevelModel gameLevel;
  final bool cheatEnabled;

  @override
  Widget build(BuildContext context) {
    controller.setGameLevel(gameLevel);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Nível: ${gameLevel.toString()}'),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          HBuilder(
            () => AnimatedOpacity(
              opacity: controller.idle ? 0 : 1,
              duration: const Duration(seconds: 1),
              child: GridView.count(
                shrinkWrap: true,
                padding: const EdgeInsets.all(5),
                crossAxisCount: 5,
                semanticChildCount: 5,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                children: GameStorage.instance.tiles.map((tile) {
                  return GameTile(
                    tile: tile,
                    onTurn: controller.onTurn,
                    reveal: cheatEnabled,
                  );
                }).toList(),
              ),
            ),
          ),
          const IgnorePointer(
            ignoring: true,
            child: Center(
              child: Opacity(
                opacity: .1,
                child: Text(
                  '💣',
                  style: TextStyle(fontSize: 100),
                ),
              ),
            ),
          ),
          HBuilder(
            () => IgnorePointer(
              ignoring: !controller.finished,
              child: AnimatedOpacity(
                opacity: controller.finished ? 1 : 0,
                duration: const Duration(milliseconds: 500),
                child: Container(
                  color: AppColors.background.withOpacity(.9),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          controller.win ? 'Parabéns\n🥳✅✨' : 'Você perdeu\n💣🔥💥',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Colors.blue,
                            minimumSize: const Size(0, 100),
                            shape: const CircleBorder(),
                          ),
                          child: Icon(controller.win ? Icons.arrow_back : Icons.replay),
                          onPressed: controller.win ? () => Navigator.pop(context) : controller.restart,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
