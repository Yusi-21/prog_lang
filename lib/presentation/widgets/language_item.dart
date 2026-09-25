import 'package:flutter/material.dart';
import '../models/language.dart';
import '../screens/detail_screen.dart';

// for practice 4 (and for practice 6)
class LanguageItem extends StatelessWidget {
  final Language language;

  const LanguageItem({super.key, required this.language});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias, // This mode has anti-aliased clipping edges
      child: ListTile(
        leading: Icon(language.icon, color: Colors.blue),
        title: Text(
          language.name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Lora',
          ),
        ),
        subtitle: Text(
          language.description,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
            fontFamily: 'Lora',
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
        onTap: () {
          // open for pr4, and close downside for pr6
          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(
          //     content: Text('Вы выбрали: ${language.name}'),
          //     duration: const Duration(seconds: 2),
          //   ),
          // );

          // open for pr6, and close upside for pr4
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(language: language),
            ),
          );
        },
      ),
    );
  }
}