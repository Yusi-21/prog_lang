import 'package:flutter/material.dart';
import 'package:prog_lang/presentation/widgets/image_list.dart';
import '../models/language.dart';
import '../widgets/language_item.dart';

// for practice 4
class HomeScreenFourth extends StatelessWidget {
  const HomeScreenFourth({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Language> languages = [
      const Language(
        icon: Icons.code,
        name: 'Dart',
        description: 'Язык для Flutter, быстрый и современный.',
        imagePath: 'assets/images/dart.png',
      ),
      const Language(
        icon: Icons.android,
        name: 'Kotlin',
        description: 'Официальный язык для Android.',
        imagePath: 'assets/images/kotlin.png',
      ),
      const Language(
        icon: Icons.coffee,
        name: 'Java',
        description: 'Классика, ООП, 30 лет на рынке.',
        imagePath: 'assets/images/java.png',
      ),
      const Language(
        icon: Icons.pets,
        name: 'Python',
        description: 'Популярен для AI, анализа данных и бэкенда.',
        imagePath: 'assets/images/python.png',
      ),
      const Language(
        icon: Icons.settings,
        name: 'C++',
        description: 'Мощный язык для систем и игр.',
        imagePath: 'assets/images/c_plus.png',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('ProgLang'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Языки программарования',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Lora'),
              ),
              const SizedBox(height: 8),

              const Text(
                'Языки программирования — это инструменты, с помощью которых разработчики создают приложения, сайты и системы. '
                'У каждого языка своя область применения: от мобильной разработки до искусственного интеллекта. '
                'Выбор языка зависит от задачи, производительности и удобства.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 14, fontFamily: 'Lora',
                ),
              ),
              const SizedBox(height: 12),

              ImageList(languages: languages),
              const SizedBox(height: 12),

              ListView.builder(
                shrinkWrap: true, //If the scroll view does not shrink wrap, then the scroll
                                  // view will expand to the maximum allowed size in the [scrollDirection].
                physics: const NeverScrollableScrollPhysics(), // Creates scroll physics that does not let the user scroll.
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  return LanguageItem(language: languages[index]);
                },
              ),

              const SizedBox(height: 12),
              const Divider(thickness: 2),
              const SizedBox(height: 8),

              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person, color: Colors.blue),
                  SizedBox(width: 8),
                  Text(
                    'Абдырахманов Юсуп',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Lora',),
                  ),
                ],
              ),
            ],
          ),
      ),
    );
  }
}