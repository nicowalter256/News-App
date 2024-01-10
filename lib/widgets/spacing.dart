import 'package:flutter/material.dart';

class Spacing extends StatelessWidget {
  final double height;
  const Spacing({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        height: height,
        width: double.infinity,
        color: Colors.grey[400],
      ),
    );
  }
}
