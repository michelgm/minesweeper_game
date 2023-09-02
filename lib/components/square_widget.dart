import 'package:flutter/material.dart';
import '../models/square.dart';

class SquareWidget extends StatelessWidget {
  // const SquareWidget({super.key});

  final Square square;
  final void Function(Square) onOpen;
  final void Function(Square) onSwitchMarked;

  SquareWidget({
    required this.square,
    required this.onOpen,
    required this.onSwitchMarked,
  });

  Widget _getImage() {
    int qtMines = square.qtMinesInNeighborhood;
    if (square.opened && square.mine && square.exploded) {
      return Image.asset('assets/images/bomba_0.jpeg');
    } else if (square.opened && square.mine) {
      return Image.asset('assets/images/bomba_1.jpeg');
    } else if (square.opened) {
      return Image.asset('assets/images/aberto_$qtMines.jpeg');
    } else if (square.marked) {
      return Image.asset('assets/images/bandeira.jpeg');
    } else {
      return Image.asset('assets/images/fechado.jpeg');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onOpen(square),
      onLongPress: () => onSwitchMarked(square),
      child: _getImage(),
    );
  }
}
