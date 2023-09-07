import 'package:flutter/material.dart';

class LevelButton extends StatelessWidget {
  const LevelButton({
    super.key,
    required this.levelText,
    required this.onPressed,
  });

  final String levelText;
  final Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed(levelText);
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
