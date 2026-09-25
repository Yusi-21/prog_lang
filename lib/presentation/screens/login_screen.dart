import 'package:flutter/material.dart';
import '../widgets/text_field.dart';
import '/routes.dart';
import 'signup_screen.dart';
import 'profile_screen.dart';

// for practice 5
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>(); //GlobalKey - unique identificator, which not changes.
                                           //FormState is state of forms (validate, save etc.)
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() { // calls this method when this [State] object will never build again
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) { // ?? - if the result(currentState) is null, return the value of right
      FocusScope.of(context).unfocus();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Успешно!')),
      );
      //open for pr4, close downside for pr6
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => ProfileScreen(
      //       name: '',
      //       email: _emailController.text,
      //     ),
      //   ),
      // );

      //open for pr6, close upside for pr4
      Navigator.pushReplacementNamed(
        context,
        Routes.home,
        arguments: {'name': '', 'email': _emailController.text},
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
                const SizedBox(height: 40),

                const Text(
                  'Добро пожаловать в ProgLang!',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lora',
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Войдите в свой аккаунт',
                  style: TextStyle(fontSize: 16, fontFamily: 'Lora'),
                ),
                const Text(
                  'Или создайте новый',
                  style: TextStyle(fontSize: 16, fontFamily: 'Lora'),
                ),
                const SizedBox(height: 30),

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

                Align( // Creates an alignment widget.
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Забыли пароль?',
                      style: TextStyle(fontFamily: 'Lora'),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _submit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      disabledForegroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      'Войти',
                      style: TextStyle(
                        color: Colors.black,
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
                      'Нет аккаунта?',
                      style: TextStyle(fontFamily: 'Lora'),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector( //Creates a widget that detects gestures.
                      onTap: () {
                        // open for pr4, close downside for pr6
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignUpScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Зарегистрируйтесь',
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