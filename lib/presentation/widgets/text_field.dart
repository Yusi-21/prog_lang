import 'package:flutter/material.dart';

// for practice 5
enum InputFieldType { name, email, password }

class CustomTextFormField extends StatefulWidget {
  final InputFieldType inputType;
  final String labelText;
  final String hintText;
  final Widget prefixIcon;
  final TextEditingController controller; //saved the text in the field entered by user

  const CustomTextFormField({
    super.key,
    required this.inputType,
    required this.labelText,
    required this.hintText,
    required this.prefixIcon,
    required this.controller
});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _hidePassword = true;

  String? _validator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Поле не может быть пустым';
    }

    switch (widget.inputType) {
      case InputFieldType.name:
        final reg = RegExp(r'^[A-Za-zА-Яа-яЁё\s]+$'); //Bob, Иван
        if (!reg.hasMatch(value)) {
          return 'Имя должно содержать только буквы';
        }
        break;

      case InputFieldType.email:
        final reg = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$'); //test123@mail.ru
        if (!reg.hasMatch(value)) {
          return 'Email должен содержать "@"';
        }
        break;
        
      case InputFieldType.password:
        final reg = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[+_\-]).{6,}$'); // at least must be letter, number, symbol. size.length>=6
        if (!reg.hasMatch(value)) {
          return 'Пароль должно быть ≥ 6 символов (с буквами, цифрами и символами)';
        }
        break;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final isPassword = widget.inputType == InputFieldType.password;

    return TextFormField(
      controller: widget.controller,
      obscureText: isPassword && _hidePassword,
      keyboardType: widget.inputType == InputFieldType.email
        ? TextInputType.emailAddress
        : TextInputType.text,
      textInputAction: TextInputAction.next,
      style: const TextStyle(
        color: Color(0xFF192252),
        fontWeight: FontWeight.w400,
        fontFamily: 'Lora',
      ),
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: isPassword
          ? IconButton(
            icon: Icon(
              _hidePassword ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() => _hidePassword = !_hidePassword);
            },
        )
            : null, // if text field not password, do not show suffix icon
        border: OutlineInputBorder( //base
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder( // by default
          borderSide: const BorderSide(color: Colors.blueGrey, width: 0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder( //in focus
          borderSide: const BorderSide(color: Colors.blueAccent, width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        errorBorder: OutlineInputBorder( // in error
          borderSide: const BorderSide(color: Colors.red, width: 0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedErrorBorder: OutlineInputBorder( // in focus + error
          borderSide: const BorderSide(color: Colors.red, width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      validator: _validator,
    );
  }
}
