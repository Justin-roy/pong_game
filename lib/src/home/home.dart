import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pong_game/src/home/game/brick.dart';
import 'package:pong_game/src/home/game/pong_ball.dart';
import 'package:pong_game/src/provider/game_provider.dart';
import 'package:pong_game/widgets/coverTitle.dart';
import 'package:pong_game/widgets/score_board.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Game Provider
    var gameProvider = Provider.of<GameProvider>(context);
    //  gameProvider.moveBricks();

    WidgetsBinding.instance!.addPostFrameCallback(
      (_) => gameProvider.moveBricks(),
    );

    return RawKeyboardListener(
      focusNode: FocusNode(),
      autofocus: true,
      onKey: (event) {
        if (event.isKeyPressed(LogicalKeyboardKey.arrowLeft)) {
          gameProvider.moveLeft();
        } else if (event.isKeyPressed(LogicalKeyboardKey.arrowRight)) {
          gameProvider.moveRight();
        }
      },
      child: GestureDetector(
        onTap: gameProvider.gameStart,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Flutter Pong'.toUpperCase(),
              style: const TextStyle(
                letterSpacing: 5.6,
                color: Colors.white,
              ),
            ),
          ),
          body: Stack(
            children: [
              // Enemy Brick
              MyBricks(
                x: gameProvider.enemyX,
                y: -0.9,
                brickWidth: gameProvider.brickWidth,
                isEnemy: true,
              ),
              // Player Brick
              MyBricks(
                x: gameProvider.playerX,
                y: 0.9,
                brickWidth: gameProvider.brickWidth,
              ),
              CoverTitle(
                isGameStarted: gameProvider.isGameStart,
              ),
              // BALL
              PongBall(
                x: gameProvider.ballX,
                y: gameProvider.ballY,
                isGameStarted: gameProvider.isGameStart,
              ),
              ScoreBoard(
                isGameStarted: gameProvider.isGameStart,
                enemyScore: gameProvider.enemyScore,
                playerScore: gameProvider.playerScore,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
