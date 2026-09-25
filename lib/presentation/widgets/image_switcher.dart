import 'package:flutter/material.dart';

// for practice 3
class ImageSwitcher extends StatefulWidget {
  const ImageSwitcher({super.key});

  @override
  State<ImageSwitcher> createState() => _ImageSwitcherState();
}

class _ImageSwitcherState extends State<ImageSwitcher> {
  final List<String> images = [
    'assets/images/dart.png',
    'assets/images/kotlin.png',
    'assets/images/java.png',
    'assets/images/python.png',
    'assets/images/c_plus.png',
  ];

  int currentIndex = 0;

  void nextImage() {
    setState(() {
      currentIndex = (currentIndex + 1) % images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageWidth = screenWidth * 0.6;
    final imageHeight = imageWidth * 0.625;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: nextImage,
          child: Container(
            width: imageWidth,
            height: imageHeight,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: ClipRRect( //Creates a rounded-rectangular clip.
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                images[currentIndex],
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
            onPressed: nextImage,
            child: const Text(
                'Сменить изображение',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                fontFamily: 'Lora',
              ),
            ),
        ),
      ],
    );
  }
}