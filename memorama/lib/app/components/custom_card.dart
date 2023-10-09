import 'package:flutter/material.dart';
import 'package:memorama/app/models/card_model.dart';
import 'package:memorama/app/services/generate_cards.dart';

class CustomCard extends StatefulWidget {
  final CardModel cardModel;
  final int index;
  bool open;
  CustomCard(
      {super.key,
      required this.cardModel,
      required this.index,
      required this.open});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  final Color _color = randomColor();

  void flipCard() {
    setState(() {
      widget.open = !widget.open;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => flipCard(),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(15),
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: _color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          widget.open ? widget.cardModel.text : '',
          style: const TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
