import 'package:ask/components/nav_bar.dart';
import 'package:ask/themes/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GlobalLayout extends StatefulWidget {
  const GlobalLayout({required this.child, super.key});

  final Widget child;

  @override
  State<GlobalLayout> createState() => _GlobalLayoutState();
}

class _GlobalLayoutState extends State<GlobalLayout> {
  int selectedIndex = 0;

  void onTab(int index) {
    setState(() {
      if (index == selectedIndex) return;
      selectedIndex = index;
    });
  }

  final List<NavItem> items = [
    NavItem(icon: SvgPicture.asset('assets/images/Learn.svg')),
    NavItem(icon: SvgPicture.asset('assets/images/Explore.svg')),
    NavItem(icon: SvgPicture.asset('assets/images/Notifications.svg')),
    NavItem(icon: SvgPicture.asset('assets/images/Library.svg')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: const Center(
        child: Button(),
      ),
      bottomNavigationBar: NavBar(
        items: items,
        selectedIndex: selectedIndex,
        onTab: onTab,
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9),
          ),
        ),
        splashFactory: NoSplash.splashFactory,
        elevation: const WidgetStatePropertyAll(0),
        backgroundColor: const WidgetStatePropertyAll(Colors2.gray900),
        foregroundColor: const WidgetStatePropertyAll(Colors2.gray950),
      ),
      child: const Text('Button'),
    );
  }
}
