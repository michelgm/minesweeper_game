import 'package:flutter/foundation.dart';
import 'dart:math';

import 'package:minesweeper_game/models/square.dart';

class Board {
  final int rows;
  final int columns;
  final int qtBombs;

  final List<Square> _squares = [];

  Board({
    required this.rows,
    required this.columns,
    required this.qtBombs,
  }) {
    _createSquares();
    _linkNeighbors();
    _raffleMines();
  }

  void restart() {
    _squares.forEach((s) => s.restart());
    _raffleMines();
  }

  void showMines() {
    _squares.forEach((s) => s.showMine());
  }

  void _createSquares() {
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < columns; c++) {
        _squares.add(Square(row: r, column: c));
      }
    }
  }

  void _linkNeighbors() {
    for (var square in _squares) {
      for (var neighbor in _squares) {
        square.addNeighbor(neighbor);
      }
    }
  }

  void _raffleMines() {
    int raffled = 0;

    if (qtBombs > rows * columns) {
      return;
    }

    while (raffled < qtBombs) {
      int i = Random().nextInt(_squares.length);

      // pode conter erro aula 439
      if (!_squares[i].mine) {
        raffled++;
        _squares[i].toMine();
      }
    }
  }

  List<Square> get squares {
    return _squares;
  }

  bool get done {
    return _squares.every((s) => s.done);
  }
}
