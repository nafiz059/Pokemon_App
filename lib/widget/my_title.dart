import 'package:flutter/material.dart';

class Mytitle extends StatelessWidget {
  final String text;
  final Color color;
  const Mytitle({
    required this.text,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: color,
          fontSize: 30.0,
        ),
      ),
    );
  }
}
