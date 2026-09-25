import 'package:flutter/material.dart';
// import 'package:prog_lang/presentation/screens/home_screen_second.dart'; // for practice 2
// import 'package:prog_lang/presentation/screens/home_screen_third.dart'; // for practice 3
// import 'package:prog_lang/presentation/screens/home_screen_fourth.dart'; // for practice 4
// import 'package:prog_lang/presentation/screens/login_screen.dart';  // for practice 5
import 'routes.dart';
import 'presentation/screens/loading_screen.dart';
import 'presentation/screens/login_screen.dart';
import 'presentation/screens/signup_screen.dart';
import 'presentation/screens/home_screen_sixth.dart';
import 'presentation/screens/detail_screen.dart';
import 'presentation/screens/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Programming Languages',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // open step by step for pr2-5, close downside for pr6
      // home: const HomeScreenSecond(), //open for practice 2, and close others
      // home: const HomeScreenThird(), //open for practice 3, and close others
      // home: const HomeScreenFourth(), //open for practice 4, and close others
      // home: const LoginScreen(), //open for practice 5, and close others

      // open for pr6, close upside for pr2-5
      initialRoute: Routes.loading,
      routes: {
        Routes.loading: (context) => const LoadingScreen(),
        Routes.login: (context) => const LoginScreen(),
        Routes.signup: (context) => const SignUpScreen(),
        Routes.home: (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?; // A route that blocks interaction with previous routes.
          return HomeScreenSixth(
            name: args?['name'] ?? '',
            email: args?['email'] ?? '',
          );
        },
      },
    );
  }
}