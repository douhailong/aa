import 'package:ask/pages/profile/app_bar.dart';
import 'package:ask/pages/profile/card.dart';
import 'package:ask/pages/profile/personal.dart';
import 'package:ask/themes/color.dart';
import 'package:ask/utils/local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      appBar: const ProfileAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Personal(),
              const SizedBox(height: 24),
              Card2(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SvgPicture.asset(
                          'assets/images/Library.svg',
                          width: 26,
                          color: Colors.red,
                        ),
                        const Text('Collection')
                      ],
                    ),
                    Column(
                      children: [
                        SvgPicture.asset(
                          'assets/images/Subscribe.svg',
                          width: 26,
                        ),
                        const Text('Subscribe')
                      ],
                    ),
                    Column(
                      children: [
                        SvgPicture.asset(
                          'assets/images/History.svg',
                          width: 26,
                        ),
                        const Text('History')
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                  onPressed: () async {
                    await LocalNotifications.initial();
                    await LocalNotifications.show('title', 'body', 'payload');
                  },
                  child: const Text('Button')),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: const Column(
                  children: [
                    PersonalItem(),
                    PersonalItem(),
                    PersonalItem(),
                    PersonalItem(),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: const Column(
                  children: [
                    PersonalItem(),
                    PersonalItem(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PersonalItem extends StatelessWidget {
  const PersonalItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.settings,
                color: Colors2.gray700,
              ),
              SizedBox(width: 6),
              Text('Settings'),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 16,
            color: Colors2.gray300,
          ),
        ],
      ),
    );
  }
}
