import 'package:flutter/material.dart';
import '../widgets/text_field.dart';
import '/routes.dart';
import 'profile_screen.dart';

// for practice 5
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>(); //GlobalKey - unique identificator, which not changes.
                                           //FormState is state of forms (validate, save etc.)
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() { // calls this method when this [State] object will never build again
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) { // ?? - if the result(currentState) is null, return the value of right
      if (_passwordController.text != _confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Пароли не совпадают')),
        );
        return;
      }
      FocusScope.of(context).unfocus();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Регистрация успешна!')),
      );
      //open for pr4, close downside for pr6
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => ProfileScreen(
      //       name: _nameController.text, // text - The current string the user is editing.
      //       email: _emailController.text,
      //     ),
      //   ),
      // );

      //open for pr6, close upside for pr4
      Navigator.pushReplacementNamed(
        context,
        Routes.home,
        arguments: {'name': _nameController.text, 'email': _emailController.text},
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea( // Creates a widget that avoids operating system interfaces (time, battery, connection etc.)
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch, // stretch - Require the children to fill the cross axis
              children: [
                const SizedBox(height: 20),

                const Text(
                  'Регистрация',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lora',
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
                  hintText: 'example@mail.com',
                  prefixIcon: const Icon(Icons.email_outlined),
                  controller: _emailController,
                ),
                const SizedBox(height: 16),

                CustomTextFormField(
                  inputType: InputFieldType.password,
                  labelText: 'Пароль',
                  hintText: 'Введите пароль',
                  prefixIcon: const Icon(Icons.lock_outline),
                  controller: _passwordController,
                ),
                const SizedBox(height: 16),

                CustomTextFormField(
                  inputType: InputFieldType.password,
                  labelText: 'Повторите пароль',
                  hintText: 'Подтвердите пароль',
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
                      'Зарегистрироваться',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lora',
                      ),
                    ),
                  ),
                ),

                const Spacer(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Уже есть аккаунт? ',
                      style: TextStyle(fontFamily: 'Lora'),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context); // Pop the top-most route off the navigator that most tightly encloses the given context.
                      },
                      child: const Text(
                        'Войдите',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Lora',
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}