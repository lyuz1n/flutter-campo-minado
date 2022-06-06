import 'package:flutter/material.dart';
import 'package:flutter_campo_minado/src/utils/colors.dart';
import 'package:flutter_campo_minado/src/screens/game/ui/game_screen.dart';
import 'package:flutter_campo_minado/src/screens/menu/controllers/menu_controller.dart';
import 'package:homura/homura.dart';

class MenuScreen extends HomuraView<MenuController> {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(child: SizedBox()),
              const Text(
                '💎 Campo Minado 💣',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Ecolha um nível abaixo para começar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Ativar cheat',
                    style: TextStyle(color: Colors.white),
                  ),
                  HBuilder(
                    () => Theme(
                      data: Theme.of(context).copyWith(
                        unselectedWidgetColor: Colors.white,
                      ),
                      child: Checkbox(
                        value: controller.cheatEnabled,
                        onChanged: controller.setCheatEnabled,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              ...controller.levels.map(
                (gameLevel) => Column(
                  children: [
                    TextButton(
                      child: Text(gameLevel.toString()),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: AppColors.bar,
                        minimumSize: const Size(double.infinity, 45),
                        elevation: 0,
                      ),
                      onPressed: () => Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, a, b) => GameScreen(
                            gameLevel: gameLevel,
                            cheatEnabled: controller.cheatEnabled,
                          ),
                          transitionDuration: Duration.zero,
                          reverseTransitionDuration: Duration.zero,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
              const Expanded(child: SizedBox()),
              const Text(
                'Desenvolvido com ❤️ por lyuz1n',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
