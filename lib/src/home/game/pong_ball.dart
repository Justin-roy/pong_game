import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class PongBall extends StatelessWidget {
  final double x, y;
  final bool isGameStarted;
  const PongBall(
      {required this.x, required this.y, required this.isGameStarted, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isGameStarted
        ? Container(
            alignment: Alignment(x, y),
            child: Container(
              height: 20,
              width: 20,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          )
        : Container(
            alignment: Alignment(x, y),
            child: AvatarGlow(
              endRadius: 60.0,
              child: Material(
                // Replace this child with your own
                elevation: 8.0,
                shape: const CircleBorder(),
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          );
  }
}
