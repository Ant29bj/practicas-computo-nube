import 'package:flutter/material.dart';
import 'package:memorama/app/app.dart';
import 'package:memorama/app/services/generate_cards.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (contex) => CardsProvider(),
      child: const App(),
    ),
  );
}
