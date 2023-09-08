import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minesweeper_game/components/level_button.dart';

import 'minesweeper_app.dart';

class DifficultySelectionPage extends StatelessWidget {
  const DifficultySelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onLevelButtonPressed(String levelText) {
      int qtBombs = 0;
      if (levelText.trim().toUpperCase() == 'EASY') {
        qtBombs = 10;
      } else if (levelText.trim().toUpperCase() == 'MEDIUM') {
        qtBombs = 20;
      } else if (levelText.trim().toUpperCase() == 'HARD') {
        qtBombs = 30;
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
            Text(
              'MINESWEEPER',
              style: GoogleFonts.vt323(
                textStyle: const TextStyle(
                    color: Color.fromARGB(255, 176, 99, 94),
                    letterSpacing: 5,
                    fontSize: 65,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(height: 120),
            Text(
              'CHOOSE THE LEVEL',
              style: GoogleFonts.dotGothic16(
                textStyle: const TextStyle(
                    color: Color.fromARGB(255, 68, 67, 67),
                    letterSpacing: 4,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 80),
            LevelButton(
              levelText: ' EASY ',
              onPressed: onLevelButtonPressed,
            ),
            const SizedBox(height: 20),
            LevelButton(
              levelText: 'MEDIUM',
              onPressed: onLevelButtonPressed,
            ),
            const SizedBox(height: 20),
            LevelButton(
              levelText: ' HARD ',
              onPressed: onLevelButtonPressed,
            ),
          ],
        ),
      ),
    );
  }
}
