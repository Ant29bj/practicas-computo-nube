import 'package:flutter/material.dart';
import 'package:memorama/app/components/custom_card.dart';
import 'package:memorama/app/services/generate_cards.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final CardsProvider _cardsRepository = CardsProvider();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CardsProvider(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: GridView.count(
            crossAxisCount: 4,
            padding: const EdgeInsets.all(8),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: List.generate(
              _cardsRepository.getTotalCards.length,
              (index) => CustomCard(
                cardModel: _cardsRepository.getTotalCards[index],
                index: index,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
