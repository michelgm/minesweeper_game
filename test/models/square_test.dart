import 'package:flutter_test/flutter_test.dart';
import 'package:minesweeper_game/models/square.dart';

void main() {
  group('Square', () {
    test('Open Square WITH Explosion', () {
      Square s = Square(row: 0, column: 0);
      s.toMine();

      expect(s.open, throwsException);
    });

    test('Open Square WITHOUT Explosion', () {
      Square s = Square(row: 0, column: 0);
      s.open();

      expect(s.opened, isTrue);
    });

    test('Add NO neighbor', () {
      Square s1 = Square(row: 0, column: 0);
      Square s2 = Square(row: 1, column: 3);
      s1.addNeighbor(s2);
      expect(s1.neighbors.isEmpty, isTrue);
    });

    test('Add neighbor', () {
      Square s1 = Square(row: 5, column: 5);
      Square s2 = Square(row: 4, column: 4);
      Square s3 = Square(row: 6, column: 6);
      Square s4 = Square(row: 4, column: 5);
      s1.addNeighbor(s2);
      s1.addNeighbor(s3);
      s1.addNeighbor(s4);
      expect(s1.neighbors.isEmpty, isFalse);
      expect(s1.neighbors.isNotEmpty, isTrue);
      expect(s1.neighbors.length, 3);
    });

    test('Mines in the neighborhood', () {
      Square s1 = Square(row: 5, column: 5);
      Square s2 = Square(row: 4, column: 4);
      s2.toMine();
      Square s3 = Square(row: 6, column: 6);
      Square s4 = Square(row: 4, column: 5);
      s4.toMine();

      s1.addNeighbor(s2);
      s1.addNeighbor(s3);
      s1.addNeighbor(s4);

      expect(s1.qtMinesInNeighborhood, 2);
    });
  });
}
