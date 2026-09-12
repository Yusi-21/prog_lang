import 'package:flutter/material.dart';
import '../models/language.dart';
import '../widgets/language_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Language> languages = [
      const Language(
        icon: Icons.code,
        name: 'Dart',
        description: 'Язык для Flutter, быстрый и современный.',
      ),
        const Language(
        icon: Icons.android,
        name: 'Kotlin',
        description: 'Официальный язык для Android.',
      ),
        const Language(
        icon: Icons.coffee,
        name: 'Java',
        description: 'Классика, ООП, 30 лет на рынке.',
      ),
        const Language(
        icon: Icons.pets,
        name: 'Python',
        description: 'Популярен для AI, анализа данных и бэкенда.',
      ),
        const Language(
        icon: Icons.settings,
        name: 'C++',
        description: 'Мощный язык для систем и игр.',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Главная'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Языки программарования',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              const Text(
                'Языки программирования — это инструменты, с помощью которых разработчики создают приложения, сайты и системы. '
                'У каждого языка своя область применения: от мобильной разработки до искусственного интеллекта. '
                'Выбор языка зависит от задачи, производительности и удобства.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 180,
                      child: Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 180,
                      padding: const EdgeInsets.all(12),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('1. Dart', style: TextStyle(fontSize: 16)),
                          Text('2. Kotlin', style: TextStyle(fontSize: 16)),
                          Text('3. Java', style: TextStyle(fontSize: 16)),
                          Text('4. Python', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Expanded(
              //     child: ListView.separated(
              //         itemCount: languages.length,
              //         separatorBuilder: (context, index) => const Divider(thickness: 1),
              //         itemBuilder: (context, index) {
              //           return Padding(
              //               padding: EdgeInsets.symmetric(vertical: 8.0),
              //               child: LanguageItem(language: languages[index]),
              //           );
              //         },
              //     ),
              // ),

              const Spacer(),
              const Divider(thickness: 2),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person, color: Colors.blue),
                  SizedBox(width: 8),
                  Text(
                    'Абдырахманов Юсуп',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
      ),
    );
  }
}