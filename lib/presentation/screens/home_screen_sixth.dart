import 'package:flutter/material.dart';
import 'package:prog_lang/presentation/widgets/image_list.dart';
import '../models/language.dart';
import '../widgets/language_item.dart';
import 'profile_screen.dart';

// for practice 6
class HomeScreenSixth extends StatefulWidget {
  final String name;
  final String email;
  const HomeScreenSixth({super.key, required this.name, required this.email});

  @override
  State<HomeScreenSixth> createState() => _HomeScreenSixthState();
}

class _HomeScreenSixthState extends State<HomeScreenSixth> {
  int _selectedIndex = 0;

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

  Widget _buildHomeContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Языки программирования',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lora',
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Языки программирования — это инструменты, с помощью которых разработчики создают приложения, сайты и системы. '
                'У каждого языка своя область применения: от мобильной разработки до искусственного интеллекта. '
                'Выбор языка зависит от задачи, производительности и удобства.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 14, fontFamily: 'Lora'),
          ),
          const SizedBox(height: 12),

          ImageList(languages: languages),
          const SizedBox(height: 12),

          LayoutBuilder( // Creates a widget that defers its building until layout.
            builder: (context, constraints) {
              if (constraints.maxWidth > 600) {
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  // Creates a delegate that makes grid layouts with a fixed number of tiles in the cross axis.
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    mainAxisExtent: 100, // all are with fixed height=100 pixels
                  ),
                  itemCount: languages.length,
                  itemBuilder: (context, index) {
                    return LanguageItem(language: languages[index]);
                  },
                );
              } else {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: languages.length,
                  itemBuilder: (context, index) {
                    return LanguageItem(language: languages[index]);
                  },
                );
              }
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
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lora',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedIndex == 0 ? 'Главная' : 'Профиль', style: TextStyle(fontFamily: 'Lora')),
        centerTitle: true,
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false, // remove backButton, because it is not need on homescreen (in profile also, because we have NavBar)
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          _buildHomeContent(),
          ProfileScreen(name: widget.name, email: widget.email),
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [ // A list of shadows cast by this box behind the box.
            BoxShadow(
              color: Colors.white,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect( // Creates a rounded-rectangular clip.
          borderRadius: BorderRadius.circular(16),
          child: NavigationBar(
            backgroundColor: Colors.blue.shade100,
            indicatorColor: Colors.black,
            selectedIndex: _selectedIndex,
            onDestinationSelected: (index) {
              setState(() => _selectedIndex = index);
            },
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_outlined, color: Colors.black),
                selectedIcon: Icon(Icons.home, color: Colors.blue),
                label: 'Главная',
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outline, color: Colors.black),
                selectedIcon: Icon(Icons.person, color: Colors.blue),
                label: 'Профиль',
              ),
            ],
          ),
        ),
      ),
    );
  }
}