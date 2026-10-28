import 'package:flutter/material.dart';
import 'package:prog_lang/theme/theme_cubit.dart';
import 'routes.dart';
import 'di/di.dart';
import 'theme/app_theme.dart';
import 'theme/theme_cubit.dart';
// import 'package:prog_lang/presentation/screens/home_screen_second.dart'; // for practice 2
// import 'package:prog_lang/presentation/screens/home_screen_third.dart'; // for practice 3
// import 'package:prog_lang/presentation/screens/home_screen_fourth.dart'; // for practice 4
// import 'package:prog_lang/presentation/screens/login_screen.dart';  // for practice 5
// import 'presentation/screens/loading_screen.dart'; // for practice 6
// import 'presentation/screens/login_screen.dart'; // for practice 6
// import 'presentation/screens/signup_screen.dart'; // for practice 6
// import 'presentation/screens/home_screen_sixth.dart'; // for practice 6
// import 'presentation/screens/profile_screen.dart'; // for practice 6
import 'presentation/screens/detail_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'pages/home/bloc/home_bloc.dart';
import 'pages/home/home_screen_seventh.dart';


void main() {
  setupDI(); // for practice-8
  runApp(const MyApp());
}

//open for practice 1-8
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Programming Languages',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       // open step by step for pr2-5, close downside for pr6
//       // home: const HomeScreenSecond(), //open for practice 2, and close others
//       // home: const HomeScreenThird(), //open for practice 3, and close others
//       // home: const HomeScreenFourth(), //open for practice 4, and close others
//       // home: const LoginScreen(), //open for practice 5, and close others
//
//       // open for pr6, close upside for pr2-5
//       // initialRoute: Routes.loading,
//       // routes: {
//       //   Routes.loading: (context) => const LoadingScreen(),
//       //   Routes.login: (context) => const LoginScreen(),
//       //   Routes.signup: (context) => const SignUpScreen(),
//       //   Routes.home: (context) {
//       //     final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?; // A route that blocks interaction with previous routes.
//       //     return HomeScreenSixth(
//       //       name: args?['name'] ?? '',
//       //       email: args?['email'] ?? '',
//       //     );
//       //   },
//       // },
//
//       // open for practice7
//       // initialRoute: Routes.home,
//       // routes: {
//       //   Routes.home: (context) => BlocProvider(
//       //     create: (_) => HomeBloc()..add(const LoadLanguagesEvent()),
//       //     child: const HomeScreenSeventh(),
//       //   ),
//       // },
//
//       // open for practice 8
//       initialRoute: Routes.home,
//       routes: {
//         Routes.home: (context) => BlocProvider(
//           create: (_) => getIt<HomeBloc>()..add(const LoadLanguagesEvent()),
//           child: const HomeScreenSeventh(),
//         )
//       },
//     );
//   }
// }

// open for practice-9
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ThemeCubit>(),
      child: BlocBuilder<ThemeCubit, ThemeMode>( // blockbuilder listens events and states, after that build ui
        builder: (context, themeMode) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Programming Languages',
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: themeMode,
            initialRoute: Routes.home,
            routes: {
              Routes.home: (context) => BlocProvider( // делает BLoC/Cubit доступным для всех дочерних виджетов.
                create: (_) => getIt<HomeBloc>()
                  ..add(const LoadLanguagesEvent()), // ..add() - Notifies the [Bloc] of a new [event] which triggers
                                                    // all corresponding [EventHandler] instances.
                child: const HomeScreenSeventh(),
              ),
            },
          );
        },
      ),
    );
  }
}