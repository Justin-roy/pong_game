import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

enum direction { UP, DOWN, LEFT, RIGHT }

class GameProvider extends ChangeNotifier {
  double _ballX = 0;
  double _ballY = 0;
  double _playerX = 0;
  double _brickWidth = 0.4;
  double _enemyX = 0.2;
  double _mobiledir = 0;
  int _playerScore = 0;
  int _enemyScore = 0;
  bool _isGameStart = false;
  var _ballYDirection = direction.DOWN;
  var _ballXDirection = direction.LEFT;

  //getters
  double get ballX => _ballX;
  double get ballY => _ballY;
  double get playerX => _playerX;
  double get enemyX => _enemyX;
  double get brickWidth => _brickWidth;
  double get mobiledir => _mobiledir;
  bool get isGameStart => _isGameStart;
  int get playerScore => _playerScore;
  int get enemyScore => _enemyScore;

  // Setter
  set isGameStart(value) {
    _isGameStart = value;
    notifyListeners();
  }

  set brickWidth(value) {
    _brickWidth = value;
    notifyListeners();
  }

  set playerX(value) {
    _playerX = value;
    notifyListeners();
  }

  set enemyX(value) {
    _enemyX = value;
    notifyListeners();
  }

  set enemyScore(value) {
    _enemyScore = value;
    notifyListeners();
  }

  set playerScore(value) {
    _playerScore = value;
    notifyListeners();
  }

  set mobiledir(value) {
    _mobiledir = value;
    notifyListeners();
  }

  // Funcitons
  updateDirection() {
    // Update vertical direction
    if (_ballY >= 0.8 &&
        _playerX + _brickWidth >= _ballX &&
        _playerX <= _ballX) {
      print(_ballX);
      _ballYDirection = direction.UP;
    } else if (_ballY <= -0.8) {
      _ballYDirection = direction.DOWN;
    }

    // Update horizontal direction
    if (_ballX >= 1) {
      _ballXDirection = direction.LEFT;
    } else if (_ballX <= -1) {
      _ballXDirection = direction.RIGHT;
    }
    notifyListeners();
  }

  moveBall() {
    // vertical direction
    if (_ballYDirection == direction.DOWN) {
      _ballY += 0.1;
    } else if (_ballYDirection == direction.UP) {
      _ballY -= 0.1;
    }

    // horizontal direction
    if (_ballXDirection == direction.RIGHT) {
      _ballX += 0.1;
    } else if (_ballXDirection == direction.LEFT) {
      _ballX -= 0.1;
    }
    notifyListeners();
  }

  moveLeft() {
    if (!(_playerX - 0.1 <= -1)) {
      _playerX -= 0.1;
    }
    notifyListeners();
  }

  moveRight() {
    if (!(_playerX + _brickWidth >= 1)) {
      _playerX += 0.1;
    }
    notifyListeners();
  }

  moveEnemy() {
    enemyX = _ballX;
  }

  // Game Start
  gameStart() {
    isGameStart = true;
    mobileSenosor();
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      // update Direction
      updateDirection();
      // move ball
      moveBall();
      // move enemy
      moveEnemy();
      if (_isPlayerDead()) {
        enemyScore++;
        timer.cancel();
        _resetGame();
      }
      if (_isEnemyDead()) {
        playerScore++;
        timer.cancel();
        _resetGame();
      }
    });
  }

  // mobile sensor
  mobileSenosor() {
    accelerometerEvents.listen((AccelerometerEvent event) {
      mobiledir = event.x;
    });
    notifyListeners();
  }

  // Player Dead
  _isPlayerDead() {
    if (_ballY >= 1) {
      return true;
    }
    return false;
  }

  // Enemy Dead
  _isEnemyDead() {
    if (_ballY <= -1) {
      return true;
    }
    return false;
  }

  // reset Game
  _resetGame() {
    _isGameStart = false;
    _ballX = 0;
    _ballY = 0;
    _playerX = 0.2;
    _enemyX = 0.2;
  }

  // Move Bricks
  moveBricks() {
    if (mobiledir >= 0.9) {
      moveLeft();
    } else if (mobiledir <= -0.9) {
      moveRight();
    }
    notifyListeners();
  }
}
