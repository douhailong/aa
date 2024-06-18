import 'dart:ui';
import 'package:ask/themes/color.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_svg/svg.dart';

class NavBar extends StatefulWidget {
  const NavBar({
    required this.items,
    required this.selectedIndex,
    required this.onTab,
    this.height = 70,
    super.key,
  });

  final List<NavItem> items;
  final int selectedIndex;
  final void Function(int index) onTab;
  final double height;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final double insetSize = 16;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = (screenWidth - insetSize * 2) / widget.items.length;

    return SafeArea(
      child: Container(
        height: widget.height,
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.only(
          left: insetSize,
          right: insetSize,
          bottom: insetSize,
        ),
        decoration: BoxDecoration(
          // color: Colors.white60.withOpacity(.5),
          borderRadius: BorderRadius.circular(24),
          // border: Border.all(
          //   color: Colors.white.withOpacity(.2),
          //   width: 1,
          //   strokeAlign: BorderSide.strokeAlignOutside,
          // ),
        ),
        child: Stack(
          children: [
            AnimatedPadding(
              duration: const Duration(milliseconds: 600),
              curve: Curves.bounceOut,
              padding: EdgeInsets.only(left: itemWidth * widget.selectedIndex),
              child: Container(
                alignment: Alignment.topCenter,
                width: itemWidth,
                child: Container(
                  width: 40,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0XFFFF001F),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: BackdropFilter(
                blendMode: BlendMode.srcATop,
                filter: ImageFilter.blur(
                  sigmaX: 19,
                  sigmaY: 19,
                ),
                child: Container(
                  color: Colors.white.withOpacity(.5),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: widget.items
                  .mapIndexed(
                    (index, item) => SubNavBar(
                      index: index,
                      selectedIndex: widget.selectedIndex,
                      item: item,
                      setSelectedIndex: widget.onTab,
                    ),
                  )
                  .toList(),
            ),
            AnimatedPadding(
              duration: const Duration(milliseconds: 600),
              curve: Curves.bounceOut,
              padding: EdgeInsets.only(left: itemWidth * widget.selectedIndex),
              child: Container(
                alignment: Alignment.topCenter,
                width: itemWidth,
                child: Container(
                  width: 30,
                  height: 5,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0XFFFF001F),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SubNavBar extends StatelessWidget {
  const SubNavBar({
    required this.item,
    required this.setSelectedIndex,
    required this.index,
    required this.selectedIndex,
    super.key,
  });

  final NavItem item;
  final void Function(int index) setSelectedIndex;
  final int index;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => setSelectedIndex(index),
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 600),
            curve: Curves.bounceOut,
            width: selectedIndex == index ? 27 : 23,
            height: selectedIndex == index ? 27 : 23,
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                  (selectedIndex == index
                      ? const Color(0XFFFF001F)
                      : Colors2.gray400),
                  BlendMode.srcATop),
              child: item.icon,
            ),
          ),
        ),
      ),
    );
  }
}

class NavItem {
  NavItem({required this.icon});

  final SvgPicture icon;
}
