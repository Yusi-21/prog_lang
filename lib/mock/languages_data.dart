import '../models/language.dart';
import 'package:flutter/material.dart';

const List<Language> languages = [
  Language(
    icon: Icons.code,
    name: 'Dart',
    description: 'Язык для Flutter, быстрый и современный.',
    imagePath: 'assets/images/dart.png',
  ),
  Language(
    icon: Icons.android,
    name: 'Kotlin',
    description: 'Официальный язык для Android.',
    imagePath: 'assets/images/kotlin.png',
  ),
  Language(
    icon: Icons.coffee,
    name: 'Java',
    description: 'Классика, ООП, 30 лет на рынке.',
    imagePath: 'assets/images/java.png',
  ),
  Language(
    icon: Icons.pets,
    name: 'Python',
    description: 'Популярен для AI, анализа данных и бэкенда.',
    imagePath: 'assets/images/python.png',
  ),
  Language(
    icon: Icons.settings,
    name: 'C++',
    description: 'Мощный язык для систем и игр.',
    imagePath: 'assets/images/c_plus.png',
  ),
];