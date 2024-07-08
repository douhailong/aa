import 'dart:async';
import 'dart:io';

import 'package:ask/layout.dart';
import 'package:ask/pages/home/page.dart';
import 'package:ask/pages/profile/page.dart';
import 'package:ask/pages/sign_in/page.dart';
import 'package:ask/server/request.dart';
import 'package:ask/themes/color.dart';
import 'package:ask/utils/local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  runZonedGuarded(() {}, (error, stack) {});

  WidgetsFlutterBinding.ensureInitialized();
  requestPersmission() async {
    if (Platform.isAndroid) {
      final status = await Permission.notification.status;

      if (status.isDenied) {
        await Permission.notification.request();
      }
    }
  }

  await requestPersmission();
  runApp(const RootApp());
}

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final _router = GoRouter(
  initialLocation: '/sign-in',
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: '/sign-in',
      builder: (context, state) => const SignInPage(),
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => GlobalLayout(
        child: child,
      ),
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const ProfilePage(),
        ),
        GoRoute(
          path: '/a',
          builder: (context, state) => const HomePage(),
        )
      ],
    ),
    // GoRoute(
    //   path: '/:id',
    //   builder: (context, state) => const GlobalLayout(
    //     child: child,
    //   ),
    // )
  ],
);
