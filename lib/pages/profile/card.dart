import 'package:flutter/material.dart';

class Card2 extends StatelessWidget {
  const Card2({
    required this.child,
    this.padding = 16,
    this.circular = 12,
    this.background = Colors.white,
    super.key,
  });

  final Widget child;
  final double padding;
  final double circular;
  // final double height;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(circular),
        color: Colors.white,
      ),
      child: child,
    );
  }
}
