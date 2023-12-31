import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:nasa_curiosities/config/constants/environment.dart';
import 'package:nasa_curiosities/config/theme/app_theme.dart';
import 'package:nasa_curiosities/config/router/app_router.dart';

Future<void> main() async {
  await Environment.loadEnvironmentVariables();
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      routerConfig: appRouter,
    );
  }
}
