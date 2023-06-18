import 'package:flutter/material.dart';

class RowDescoine extends StatelessWidget {
  const RowDescoine({super.key, required this.listWidget});
  final List<Widget> listWidget;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: listWidget,
      ),
    );
  }
}
