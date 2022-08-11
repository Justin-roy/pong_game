import 'package:flutter/material.dart';

class MyBricks extends StatelessWidget {
  final double x, y, brickWidth;
  final bool isEnemy;
  const MyBricks({
    required this.x,
    required this.y,
    required this.brickWidth,
    this.isEnemy = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment((2 * x + brickWidth) / (2 - brickWidth), y),
      child: Container(
        height: 20,
        width: MediaQuery.of(context).size.width * brickWidth / 2,
        decoration: BoxDecoration(
          color: isEnemy ? Colors.deepPurple : Colors.pink[300],
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
