import 'package:flutter/material.dart';

class AuthTextFormField extends StatelessWidget {
  const AuthTextFormField(
      {super.key,
      required this.controller,
      required this.label,
      required this.type,
      required this.valida,
      required this.hide,
      required this.icon});

  final TextEditingController controller;
  final String label;
  final TextInputType type;
  final String? Function(String?) valida;
  final bool hide;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        keyboardType: type,
        obscureText: hide,
        decoration: InputDecoration(
            prefixIcon: Icon(icon),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            label: Text(label)),
        validator: valida);
  }
}
