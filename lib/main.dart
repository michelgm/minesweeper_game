import 'package:flutter/material.dart';
import 'package:minesweeper_game/screens/difficulty_selection_page.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DifficultySelectionPage(),
    ),
  );
}
