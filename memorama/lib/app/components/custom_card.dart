import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:memorama/app/models/card_model.dart';
import 'package:memorama/app/services/generate_cards.dart';
import 'package:provider/provider.dart';

class CustomCard extends StatefulWidget {
  final CardModel cardModel;
  final int index;
  const CustomCard({
    super.key,
    required this.cardModel,
    required this.index,
  });

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  final Color _color = randomColor();
  @override
  Widget build(BuildContext context) {
    return FlipCard(
      onFlip: () {
        Provider.of<CardsProvider>(context, listen: false)
            .verifyActual(widget.index);
      },
      direction: FlipDirection.HORIZONTAL,
      side: CardSide.BACK,
      flipOnTouch: widget.cardModel.found ? false : true,
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
          widget.cardModel.text,
          style: const TextStyle(
            fontSize: 45,
            color: Colors.white,
          ),
        ),
      ),
      back: Container(
        decoration: BoxDecoration(
          color: _color,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
