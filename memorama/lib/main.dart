import 'package:flutter/material.dart';
import 'package:memorama/app/app.dart';
import 'package:memorama/app/provider/game_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => GameProvider(),
      child: const App(),
    ),
  );
}
