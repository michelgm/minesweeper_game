import 'package:flutter/material.dart';
import 'package:minesweeper_game/components/board_widget.dart';
import 'package:minesweeper_game/models/board.dart';
import '../components/result_widget.dart';
import '../models/square.dart';
import '../models/explosion_exeption.dart';

class MineSweeper extends StatefulWidget {
  @override
  State<MineSweeper> createState() => _MineSweeperState();
}

class _MineSweeperState extends State<MineSweeper> {
  bool? _win;
  Board? _board;

  void _restart() {
    setState(() {
      _win = null;
      _board!.restart();
    });
  }

  void _open(Square square) {
    if (_win != null) {
      return;
    }

    setState(() {
      try {
        square.open();
        if (_board!.done) {
          _win = true;
        }
      } on ExplosionExeption {
        _win = false;
        _board!.showMines();
      }
    });
  }

  void _switchMarked(Square square) {
    if (_win != null) {
      return;
    }

    setState(() {
      square.switchMarked();
      if (_board!.done) {
        _win = true;
      }
    });
  }

  Board _getBoard(double width, double height) {
    if (_board == null) {
      int qtColumns = 15;
      double sizeSquare = width / qtColumns;
      int qtRows = (height / sizeSquare).floor();

      _board = Board(
        rows: qtRows,
        columns: qtColumns,
        qtBombs: 3,
      );
    }
    return _board!;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ResultWidget(
          win: _win,
          onRestart: _restart,
        ),
        body: Container(
          color: Colors.grey,
          child: LayoutBuilder(
            builder: (ctx, constraints) {
              return BoardWidget(
                board: _getBoard(
                  constraints.maxWidth,
                  constraints.maxHeight,
                ),
                onOpen: _open,
                onSwitchMarked: _switchMarked,
              );
            },
          ),
        ),
      ),
    );
  }
}
