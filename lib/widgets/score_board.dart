import 'package:flutter/material.dart';

class ScoreBoard extends StatelessWidget {
  final bool isGameStarted;
  final int enemyScore, playerScore;
  const ScoreBoard({
    Key? key,
    required this.isGameStarted,
    required this.enemyScore,
    required this.playerScore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isGameStarted
        ? Stack(
            children: [
              Container(
                alignment: const Alignment(0, 0),
                child: Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width / 4,
                  color: Colors.grey[800],
                ),
              ),
              Container(
                  alignment: const Alignment(0, 0.3),
                  child: Text(
                    playerScore.toString(),
                    style: TextStyle(
                      fontSize: 100,
                      color: Colors.grey[800],
                    ),
                  )),
              Container(
                  alignment: const Alignment(0, -0.3),
                  child: Text(
                    enemyScore.toString(),
                    style: TextStyle(
                      fontSize: 100,
                      color: Colors.grey[800],
                    ),
                  )),
            ],
          )
        : Container();
  }
}
