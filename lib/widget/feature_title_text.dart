import 'package:flutter/material.dart';

class FeatureTitleText extends StatelessWidget {
  final String text;
  const FeatureTitleText({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 18.0, color: Colors.grey),
      ),
    );
  }
}
