import 'package:ask/components/button.dart';
import 'package:ask/themes/color.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors2.blue200,
              Colors2.rose100,
              Colors2.gray200,
            ],
          ),
        ),
        child: Center(
          child: Button(
            onPressed: () {
              showModalBottomSheet(
                  context: context, builder: (a) => Container());
            },
            child: const Text('Get started'),
          ),
        ),
      ),
    );
  }
}
