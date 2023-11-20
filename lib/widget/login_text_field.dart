import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final String name;
  final Icon? icon;
  final IconButton? sufiIcon;
  final Function(String)? validar;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool isObscureText;

  const LoginTextField({
    Key? key,
    required this.name,
    this.icon,
    this.sufiIcon,
    this.validar,
    this.controller,
    required this.keyboardType,
    required this.isObscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30, left: 30, top: 10),
      child: TextFormField(
        obscureText: isObscureText,
        keyboardType: keyboardType,
        controller: controller,
        validator: (value) {
          if (validar != null) {
            return validar!(value!);
          }
          return null;
        },
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          suffixIcon: sufiIcon,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              width: 3,
              color: Color(0xFF550F12),
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(width: 3,
              color: Color(0xFF555555),
            ),
          ),
          labelText: name,
          labelStyle: const TextStyle(color: Color(0xFF555555), fontSize: 16),
          prefixIcon: icon,
        ),
      ),
    );
  }
}
