import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:memorama/app/models/card_model.dart';

Color randomColor() {
  Color color =
      Colors.primaries[math.Random().nextInt(Colors.primaries.length)];
  return color;
}

class CardsProvider with ChangeNotifier {
  var currentCard = CardModel();
  List<CardModel> cardStack = [];
  final List<CardModel> _cards = [
    CardModel(text: '👻'),
    CardModel(text: '👽'),
    CardModel(text: '👾'),
    CardModel(text: '🦝'),
    CardModel(text: '🐷'),
    CardModel(text: '🤠'),
    CardModel(text: '🤡'),
    CardModel(text: '🐱'),
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

  void pushCardToStack(CardModel cardModel) {
    cardStack.add(cardModel);
    notifyListeners();
  }

  void flushStack() {
    cardStack = [];
    notifyListeners();
  }

  int get getLengtOfStack => cardStack.length;

  void verifyActual(int current) {}
}
