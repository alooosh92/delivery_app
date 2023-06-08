import 'package:flutter/material.dart';

class TextFormFieldSearch extends StatelessWidget {
  const TextFormFieldSearch({
    super.key,
    required this.text,
    required this.onchanged,
  });
  final String text;
  final Function(String val) onchanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        onChanged: onchanged,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: text,
          prefixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }
}
