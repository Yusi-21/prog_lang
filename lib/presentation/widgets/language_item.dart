import 'package:flutter/material.dart';
import '../models/language.dart';

class LanguageItem extends StatelessWidget {
  final Language language;

  const LanguageItem({super.key, required this.language});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(language.icon, size: 40, color: Colors.blue),
        const SizedBox(width: 16),
        Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  language.name,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  language.description,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
        ),
      ],
    );
  }
}