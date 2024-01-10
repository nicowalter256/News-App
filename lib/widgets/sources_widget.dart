import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../models/sources.dart';

class SourcesWidget extends StatelessWidget {
  final Source source;
  const SourcesWidget({super.key, required this.source});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: Colors.grey[200],
        child: Center(
          child: Text(
            source.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
