import 'dart:async';
import 'package:flutter/material.dart';
import '../../routes.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      if (!mounted) return; // mounted - Whether this [State] object is currently in a tree.
      Navigator.pushReplacementNamed(context, Routes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black, width: 3),
              ),
              child: const Icon(
                Icons.code,
                size: 80,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 40),

            const Text(
              'ProgLang',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                fontFamily: 'Lora',
              ),
            ),
            const SizedBox(height: 20),

            const CircularProgressIndicator(color: Colors.blue),
          ],
        ),
      ),
    );
  }
}