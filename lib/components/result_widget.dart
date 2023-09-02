import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget implements PreferredSizeWidget {
  // const ResultWidget({super.key});

  final bool? win;
  final Function()? onRestart;

  ResultWidget({
    required this.win,
    required this.onRestart,
  });

  Color _getColor() {
    if (win == null) {
      return Colors.yellow;
    } else if (win!) {
      return Colors.green[300]!;
    } else {
      return Colors.red[300]!;
    }
  }

  IconData _getIcon() {
    if (win == null) {
      return Icons.sentiment_satisfied;
    } else if (win!) {
      return Icons.sentiment_very_satisfied;
    } else {
      return Icons.sentiment_very_dissatisfied;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: CircleAvatar(
            backgroundColor: _getColor(),
            child: IconButton(
              padding: EdgeInsets.all(0),
              icon: Icon(
                _getIcon(),
                color: Colors.black,
                size: 35,
              ),
              onPressed: onRestart,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(120);
}
