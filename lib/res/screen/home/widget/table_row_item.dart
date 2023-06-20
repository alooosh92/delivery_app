import 'package:flutter/material.dart';

class TabelRowheadColum extends StatelessWidget {
  const TabelRowheadColum({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      color: Colors.black38,
      child: Center(
        child: Text(
          text,
          style:
              const TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
    );
  }
}

TableRow tabelRowHeader() {
  return const TableRow(
    children: [
      TabelRowheadColum(text: "المادة المطلوبة"),
      TabelRowheadColum(text: "العدد"),
      TabelRowheadColum(text: "السعر"),
    ],
  );
}

TableRow tabelRowItem(String item, int number, int price) {
  return TableRow(
    children: [
      SizedBox(
        height: 20,
        child: Center(
          child: Text(item),
        ),
      ),
      SizedBox(
        height: 20,
        child: Center(
          child: Text(number.toString()),
        ),
      ),
      SizedBox(
        height: 20,
        child: Center(
          child: Text((number * price).toString()),
        ),
      ),
    ],
  );
}
