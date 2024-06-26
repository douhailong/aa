import 'package:ask/components/nav_bar.dart';
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
      body: widget.child,
      bottomNavigationBar: NavBar(
        items: items,
        selectedIndex: selectedIndex,
        onTab: onTab,
      ),
    );
  }
}
