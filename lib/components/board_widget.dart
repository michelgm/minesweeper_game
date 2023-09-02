import 'package:flutter/material.dart';
import 'package:minesweeper_game/components/square_widget.dart';

import '../models/square.dart';
import '../models/board.dart';

class BoardWidget extends StatelessWidget {
  final Board board;
  final void Function(Square) onOpen;
  final void Function(Square) onSwitchMarked;

  BoardWidget({
    required this.board,
    required this.onOpen,
    required this.onSwitchMarked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: board.columns,
        children: board.squares.map((s) {
          return SquareWidget(
            square: s,
            onOpen: onOpen,
            onSwitchMarked: onSwitchMarked,
          );
        }).toList(),
      ),
    );
  }
}
