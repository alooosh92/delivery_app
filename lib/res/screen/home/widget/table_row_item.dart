import 'package:flutter/material.dart';

TableRow tabelRowHeader() {
  return TableRow(
    children: [
      Container(
        height: 20,
        color: Colors.black38,
        child: const Center(
          child: Text(
            "المادة المطلوبة",
            style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ),
      ),
      Container(
        height: 20,
        color: Colors.black38,
        child: const Center(
          child: Text(
            "العدد",
            style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ),
      ),
      Container(
        height: 20,
        color: Colors.black38,
        child: const Center(
          child: Text(
            "السعر",
            style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ),
      ),
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
