import 'package:flutter/cupertino.dart';

class InfoCard extends StatelessWidget {
  const InfoCard(
      {super.key,
      required this.text,
      required this.heigh,
      required this.margin,
      required this.textSize});
  final String text;
  final double textSize;
  final double margin;
  final double heigh;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: margin, right: margin),
      height: heigh,
      padding: EdgeInsets.only(left: margin, right: margin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: textSize, fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
