import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:memorama/app/models/card_model.dart';

Color randomColor() {
  Color color =
      Colors.primaries[math.Random().nextInt(Colors.primaries.length)];
  return color;
}

class CardsProvider with ChangeNotifier {
  var actual;

  final List<CardModel> _cards = [
    CardModel(text: '👻'),
    CardModel(text: '👽'),
    CardModel(text: '👾'),
    CardModel(text: '🦝'),
    CardModel(text: '🐷'),
    CardModel(text: '🤠'),
    CardModel(text: '🤡'),
    CardModel(text: '🐱‍👤'),
    CardModel(text: '🤑'),
    CardModel(text: '🐀'),
    CardModel(text: '🐵'),
    CardModel(text: '🦇'),
  ];

  List<CardModel> totalCards = [];
  CardsProvider() {
    totalCards = List.from(_cards)..addAll(_cards);
    totalCards.shuffle();
  }

  List get getTotalCards => totalCards;

  void verifyActual(int current) {
    print('entre');
    if (actual == null) {
      actual = current;
    } else if (totalCards[actual].text == totalCards[current].text &&
        actual != current) {
      totalCards[actual].found = true;
      totalCards[current].found = true;
      print('Par');
    } else {
      print('Reset');
      actual = null;
    }
    notifyListeners();
  }
}
