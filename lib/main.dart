import 'package:flutter/material.dart';
import 'package:pong_game/src/home/home.dart';
import 'package:pong_game/src/provider/game_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<GameProvider>(
      create: (BuildContext ctx) => GameProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Pong Game',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[900],
        appBarTheme: const AppBarTheme(
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
