import 'package:flutter/material.dart';

class ElevWidget extends StatelessWidget {
  const ElevWidget({super.key, required this.elev, required this.size});

  final double elev;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Start(order: 1, elv: elev.round(), size: size),
        Start(order: 2, elv: elev.round(), size: size),
        Start(order: 3, elv: elev.round(), size: size),
        Start(order: 4, elv: elev.round(), size: size),
        Start(order: 5, elv: elev.round(), size: size),
      ],
    );
  }
}

class Start extends StatelessWidget {
  const Start({
    super.key,
    required this.order,
    required this.elv,
    required this.size,
  });
  final int order;
  final int elv;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.star_rate_rounded,
      size: size,
      color: order <= elv ? Colors.amber : Colors.black26,
    );
  }
}
