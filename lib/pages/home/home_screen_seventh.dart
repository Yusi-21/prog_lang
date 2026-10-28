import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/language.dart';
import '../../presentation/widgets/image_list.dart';
import '../../presentation/widgets/language_item.dart';
import 'bloc/home_bloc.dart';
import '../../theme/theme_toggle_action.dart';

class HomeScreenSeventh extends StatelessWidget {
  const HomeScreenSeventh({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProgLang', style: TextStyle(fontFamily: 'Lora')),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: const [ThemeToggleAction()],  // added for practice 9
      ),
      body: BlocBuilder<HomeBloc, HomeState>( // blockbuilder listens events and states, after that build ui
          builder: (context, state) {
            switch(state) {
              case HomeInitial():
                return const Center(child: Text('Данные ещё не загружены'));

              case HomeLoading():
                return const Center(child: CircularProgressIndicator());

              case HomeError(:final message):
                return Center(child: Text(message));

              case HomeLoaded(:final languages): // take the field languages from HomeLoaded and set to variable languages
                return _buildLoadedContent(languages);
            }
          },
      ),
    );
  }

  Widget _buildLoadedContent(List<Language> languages) {
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
            'Языки программирования — это инструменты, с помощью которых разработчики создают приложения, сайты и системы.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 14, fontFamily: 'Lora'),
          ),
          const SizedBox(height: 12),

          ImageList(languages: languages),
          const SizedBox(height: 12),

          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 600) {
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    mainAxisExtent: 100,
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
}