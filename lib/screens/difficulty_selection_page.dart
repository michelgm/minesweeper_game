import 'package:flutter/material.dart';
import 'package:minesweeper_game/components/level_button.dart';

class DifficultySelectionPage extends StatelessWidget {
  const DifficultySelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Choose Level',
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(height: 80),
            LevelButton(levelText: '  EASY  '),
            SizedBox(height: 20),
            LevelButton(levelText: 'MEDIUM'),
            SizedBox(height: 20),
            LevelButton(levelText: '  HARD  '),
          ],
        ),
      ),
    );
  }
}
