import 'package:flutter/material.dart';
import 'package:story_app/config/routes.dart';
import 'package:story_app/config/themes.dart';
import 'package:story_app/injection_container.dart';

void main() async {
  await initializeDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Story App',
      routerConfig: router,
      theme: lightTheme,
      darkTheme: darkTheme,
    );
  }
}
