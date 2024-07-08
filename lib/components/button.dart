import 'package:flutter/material.dart';
import 'package:ask/themes/color.dart';

class Button extends StatelessWidget {
  const Button({
    required this.child,
    required this.onPressed,
    super.key,
  });

  final Widget child;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      // style: ButtonStyle(overlayColor: WidgetStatePropertyAll(Colors.red)),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9),
        ),
        splashFactory: NoSplash.splashFactory,
        elevation: 0,
        backgroundColor: Colors2.gray900,
        foregroundColor: Colors2.gray100,
      ),
      child: child,
    );
  }
}
