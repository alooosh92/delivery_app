import 'package:delivery_app/res/screen/map/widget/map_body.dart';
import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key, required this.text, required this.press});
  final String text;
  final Function() press;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MapBody(text: text, press: press),
    );
  }
}
