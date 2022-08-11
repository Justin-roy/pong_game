import 'package:flutter/material.dart';

class CoverTitle extends StatelessWidget {
  final bool isGameStarted;
  const CoverTitle({required this.isGameStarted, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0, -0.2),
      child: Text(
        isGameStarted ? '' : 'Tap to play'.toUpperCase(),
        style: const TextStyle(
          letterSpacing: 6.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
