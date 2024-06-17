import 'package:ask/themes/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget, A {
  const ProfileAppBar({super.key})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize;

  final double iconSize = 26;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(13),
        child: GestureDetector(
          onTap: () {},
          child: SvgPicture.asset('assets/images/Sweep.svg'),
        ),
      ),
      actions: [
        SvgPicture.asset('assets/images/Setting.svg', width: 24),
        const SizedBox(width: 12),
        SvgPicture.asset('assets/images/Notifications.svg', width: 24),
        const SizedBox(width: 12),
        SvgPicture.asset('assets/images/Sweep.svg', width: 24),
        const SizedBox(width: 12)
      ],
    );
  }
}

abstract class A {}
