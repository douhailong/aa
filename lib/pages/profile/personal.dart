import 'package:ask/pages/profile/page.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:ask/themes/color.dart';
import 'package:flutter/material.dart';

class Personal extends StatelessWidget {
  const Personal({super.key});

  // final controller = MobileScannerController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // CircleAvatar(
            //   radius: 32,
            //   // backgroundImage: AssetImage('assets/images/avatar.jpeg'),
            // ),
            Text(
              'Account To',
              style: TextStyle(color: Colors2.gray700, fontSize: 24),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.send_rounded),
                Text(
                  'China',
                  style: TextStyle(color: Colors2.gray700, fontSize: 16),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
