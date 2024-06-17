import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Image.asset('assets/images/a.jpg'),
          Image.asset('assets/images/b.jpg'),
          Image.asset('assets/images/c.jpg'),
          Image.asset('assets/images/b.jpg'),
        ],
      ),
    );
  }
}
