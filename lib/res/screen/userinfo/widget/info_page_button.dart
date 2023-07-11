import 'package:flutter/material.dart';

class InfopageButton extends StatelessWidget {
  const InfopageButton({
    super.key,
    required this.press,
    required this.text,
    required this.buttonColore,
    required this.textColor,
  });
  final Function() press;
  final String text;
  final Color? buttonColore;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press,
      style: ButtonStyle(
        fixedSize: MaterialStatePropertyAll(
          Size(MediaQuery.of(context).size.width * 0.4, 20),
        ),
        backgroundColor: MaterialStatePropertyAll(buttonColore),
      ),
      child: Text(text, style: TextStyle(color: textColor)),
    );
  }
}
