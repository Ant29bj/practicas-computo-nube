import 'package:flutter/material.dart';
import 'package:memorama/app/models/card_model.dart';

class GameProvider with ChangeNotifier {
  var cardStack = [];

  List<CardModel> _listOfCards = [
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

  onInit() {
    _listOfCards = List.from(_listOfCards)..addAll(_listOfCards);
    _listOfCards.shuffle();
  }

  get getListOfCards => _listOfCards;

  get getTotalCheck => cardStack;

  void addStack(String text, int index) {
    var objet = {
      'text': text,
      'index': index,
    };
    cardStack.add(objet);
    notifyListeners();
  }

  bool verifyCards() {
    var card1 = cardStack[0];
    var card2 = cardStack[1];

    // var card1Open = !_listOfCards[card1['index']].open;
    // _listOfCards[card1['index']].open = card1Open;

    // var card2Open = !_listOfCards[card2['index']].open;
    // _listOfCards[card2['index']].open = card2Open;

    if (card1['text'] == card2['text'] && card1['index'] != card2['index']) {
      _listOfCards[card1['index']].found = true;
      _listOfCards[card2['index']].found = true;

      cardStack = [];
      notifyListeners();
      return true;
    } else if (card1['text'] == card2['text'] &&
        card1['index'] == card2['index']) {
      print('Elije otra carta');
      cardStack = [];
      return false;
    } else {
      print('Impar');
      cardStack = [];
      notifyListeners();
      return false;
    }
  }
}
