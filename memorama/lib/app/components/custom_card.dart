import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:memorama/app/provider/game_provider.dart';
import 'package:memorama/app/services/game.dart';
import 'package:provider/provider.dart';

class CustomCard extends StatefulWidget {
  final String textCard;
  final int index;
  final bool found;
  final FlipCardController controller;
  final void Function() fillpAllCardsCallback;
  const CustomCard({
    super.key,
    required this.textCard,
    required this.index,
    required this.found,
    required this.controller,
    required this.fillpAllCardsCallback,
  });

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  final Color _color = randomColor();

  // FlipCardController _controller = FlipCardController();
  @override
  void initState() {
    super.initState();
    // _controller = FlipCardController();
  }

  void _handleTap() {
    final _provider = Provider.of<GameProvider>(context, listen: false);
    if (widget.found) {
      return;
    }

    if (_provider.getTotalCheck.length < 2) {
      _provider.cardStack.add({'text': widget.textCard, 'index': widget.index});
      widget.controller.toggleCard();
      if (_provider.getTotalCheck.length == 2) {
        _provider.verifyCards();
        widget.fillpAllCardsCallback();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _handleTap();
      },
      child: FlipCard(
        controller: widget.controller,
        side: widget.found ? CardSide.FRONT : CardSide.BACK,
        flipOnTouch: false,
        front: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(15),
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            widget.textCard,
            style: const TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          ),
        ),
        back: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(15),
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
