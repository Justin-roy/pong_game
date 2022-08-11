import 'package:flutter/material.dart';

showCustomDialog(BuildContext context) {
  return showDialog(
      context: (context),
      builder: (contex) {
        return AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: const Text(
            'Game Over',
            style: TextStyle(
              letterSpacing: 3.5,
              fontSize: 28,
              color: Colors.white,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      });
}
