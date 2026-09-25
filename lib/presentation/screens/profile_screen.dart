import 'package:flutter/material.dart';
import '../widgets/text_field.dart';

// for practice 5
class ProfileScreen extends StatefulWidget {
  final String name;
  final String email;

  const ProfileScreen({
    super.key,
    required this.name,
    required this.email,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController; // controller, that is saves user's entered text later
  late final TextEditingController _emailController;
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _emailController = TextEditingController(text: widget.email);
  }

  @override
  void dispose() { // Called when this object is removed from the tree permanently.
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      FocusScope.of(context).unfocus();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Профиль сохранён')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   backgroundColor: Colors.white,
    //   appBar: AppBar(
    //     backgroundColor: Colors.white,
    //     elevation: 0,
    //     leading: IconButton(
    //       icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
    //       onPressed: () => Navigator.pop(context),
    //     ),
    //     title: const Text(
    //       'Профиль',
    //       style: TextStyle(
    //         color: Colors.black,
    //         fontSize: 22,
    //         fontWeight: FontWeight.bold,
    //         fontFamily: 'Lora',
    //       ),
    //     ),
    //     centerTitle: true,
    //   ),
    // body: SafeArea(
      return SafeArea( // Creates a widget that avoids operating system interfaces. (time, battery, connection etc.)
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView( // Creates a box in which a single widget can be scrolled.
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch, // stretch - Require the children to fill the cross axis
                children: [
                  const SizedBox(height: 10),

                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.blue, width: 2),
                      ),
                      child: ClipOval( // Creates an oval-shaped clip of photo.
                        child: Image.asset(
                          'assets/images/avatar.png',
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  CustomTextFormField(
                    inputType: InputFieldType.name,
                    labelText: 'Ваше имя',
                    hintText: 'Юсуп',
                    prefixIcon: const Icon(Icons.person_outline),
                    controller: _nameController,
                  ),
                  const SizedBox(height: 16),

                  CustomTextFormField(
                    inputType: InputFieldType.email,
                    labelText: 'Email',
                    hintText: 'example@gmail.com',
                    prefixIcon: const Icon(Icons.email_outlined),
                    controller: _emailController,
                  ),
                  const SizedBox(height: 16),

                  CustomTextFormField(
                    inputType: InputFieldType.password,
                    labelText: 'Пароль',
                    hintText: 'Введите новый пароль',
                    prefixIcon: const Icon(Icons.lock_outline),
                    controller: _passwordController,
                  ),
                  const SizedBox(height: 16),

                  CustomTextFormField(
                    inputType: InputFieldType.password,
                    labelText: 'Повторите пароль',
                    hintText: 'Повторите новый пароль',
                    prefixIcon: const Icon(Icons.lock_outline),
                    controller: _confirmPasswordController,
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _submit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        'Сохранить',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Lora',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      // ),
    );
  }
}