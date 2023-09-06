import 'package:flutter/material.dart';
import 'package:minesweeper_game/screens/minesweeper_app.dart';

class LevelButton extends StatelessWidget {
  const LevelButton({
    super.key,
    required this.levelText,
  });

  final String levelText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MineSweeper()));
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 40,
        ),
        backgroundColor: Colors.grey[600],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: Text(
        levelText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
