import 'package:flutter_test/flutter_test.dart';
import 'package:minesweeper_game/models/board.dart';

void main() {
  test('Ganhar jogo', () {
    Board board = Board(
      rows: 2,
      columns: 2,
      qtBombs: 0,
    );

    board.squares[0].toMine();
    board.squares[3].toMine();

    //playing
    board.squares[0].switchMarked();
    board.squares[1].open();
    board.squares[2].open();
    board.squares[3].switchMarked();

    expect(board.done, isTrue);
  });
}
