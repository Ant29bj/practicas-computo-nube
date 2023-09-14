import 'package:flutter/material.dart';
import 'package:practica_03/app/views/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const primary = Colors.blueAccent;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Practica 3',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primary),
        inputDecorationTheme: const InputDecorationTheme(),
      ),
      home: const Home(title: 'Practica 3'),
    );
  }
}
