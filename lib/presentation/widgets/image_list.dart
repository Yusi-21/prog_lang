import 'package:flutter/material.dart';
import '../models/language.dart';

// for practice 4
class ImageList extends StatelessWidget {
  final List<Language> languages;

  const ImageList({super.key, required this.languages});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder( // Creates a scrollable, linear array of widgets that are created on demand.
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(), //Creates scroll physics that bounce back from the edge.
        itemCount: languages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: ClipRRect( //Creates a rounded-rectangular clip
              borderRadius: BorderRadius.circular(16),
              child: Container(
                width: 160,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent, width: 1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipRRect( //Creates a rounded-rectangular clip
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    languages[index].imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}