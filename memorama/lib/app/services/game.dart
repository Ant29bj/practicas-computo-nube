import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:memorama/app/models/card_model.dart';

Color randomColor() {
  Color color =
      Colors.primaries[math.Random().nextInt(Colors.primaries.length)];
  return color;
}

class Game {
  var currentCard = CardModel();
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

  Game() {
    totalCards = List.from(_cards)..addAll(_cards);
    totalCards.shuffle();
  }

  List<CardModel> get getTotalCards => totalCards;

  void setTotalCards(List<CardModel> cards) {
    totalCards = cards;
  }
}
