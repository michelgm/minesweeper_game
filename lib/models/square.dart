import 'package:flutter/foundation.dart';
import 'explosion_exeption.dart';

class Square {
  final int row;
  final int column;
  final List<Square> neighbors = [];

  bool _opened = false;
  bool _marked = false;
  bool _mine = false;
  bool _exploded = false;

  Square({
    required this.row,
    required this.column,
  });

  void addNeighbor(Square neighbor) {
    final deltaRow = (row - neighbor.row).abs();
    final deltaColumn = (column - neighbor.column).abs();

    if (deltaRow == 0 && deltaColumn == 0) {
      return;
    }

    if (deltaRow <= 1 && deltaColumn <= 1) {
      neighbors.add(neighbor);
    }
  }

  void open() {
    if (_opened) {
      return;
    }

    _opened = true;

    if (_mine) {
      _exploded = true;
      throw ExplosionExeption();
    }

    if (safeNeighborhood) {
      for (var n in neighbors) {
        n.open();
      }
    }
  }

  void showMine() {
    if (_mine) {
      _opened = true;
    }
  }

  void toMine() {
    _mine = true;
  }

  void switchMarked() {
    _marked = !_marked;
  }

  void restart() {
    _opened = false;
    _marked = false;
    _mine = false;
    _exploded = false;
  }

  bool get mine {
    return _mine;
  }

  bool get exploded {
    return _exploded;
  }

  bool get opened {
    return _opened;
  }

  bool get marked {
    return _marked;
  }

  bool get done {
    bool mineAndMarked = mine && marked;
    bool safeAndOpened = !mine && opened;
    return mineAndMarked || safeAndOpened;
  }

  bool get safeNeighborhood {
    return neighbors.every((n) => !n._mine);
  }

  int get qtMinesInNeighborhood {
    return neighbors.where((n) => n.mine).length;
  }
}
