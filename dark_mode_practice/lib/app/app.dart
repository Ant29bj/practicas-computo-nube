import 'package:dark_mode_practice/app/themes/themeProvider.dart';
import 'package:dark_mode_practice/app/views/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Home(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
