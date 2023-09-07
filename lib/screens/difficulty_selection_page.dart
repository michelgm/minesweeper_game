import 'package:flutter/material.dart';
import 'package:minesweeper_game/components/level_button.dart';

import 'minesweeper_app.dart';

class DifficultySelectionPage extends StatelessWidget {
  const DifficultySelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onLevelButtonPressed(String levelText) {
      int qtBombs = 0;
      if (levelText.trim().toUpperCase() == 'EASY') {
        qtBombs = 5;
      } else if (levelText.trim().toUpperCase() == 'MEDIUM') {
        qtBombs = 10;
      } else if (levelText.trim().toUpperCase() == 'HARD') {
        qtBombs = 15;
      }

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MineSweeper(qtBombs: qtBombs),
        ),
      );
    }

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Choose Level',
              style: TextStyle(fontSize: 40),
            ),
            const SizedBox(height: 80),
            LevelButton(
              levelText: '  EASY  ',
              onPressed: onLevelButtonPressed,
            ),
            const SizedBox(height: 20),
            LevelButton(
              levelText: 'MEDIUM',
              onPressed: onLevelButtonPressed,
            ),
            const SizedBox(height: 20),
            LevelButton(
              levelText: '  HARD  ',
              onPressed: onLevelButtonPressed,
            ),
          ],
        ),
      ),
    );
  }
}
