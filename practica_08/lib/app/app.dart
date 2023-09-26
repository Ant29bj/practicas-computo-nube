import 'package:flutter/material.dart';
import 'package:practica_08/app/views/home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff4a4a4a),
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
