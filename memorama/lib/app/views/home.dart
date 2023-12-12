import 'dart:math';

import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:memorama/app/components/custom_card.dart';
import 'package:memorama/app/provider/game_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FlipCardController controller = FlipCardController();

  @override
  void initState() {
    final _provider = Provider.of<GameProvider>(context, listen: false);
    _provider.onInit();
    controller = FlipCardController();
    super.initState();
  }

  final List<FlipCardController> _cardControllers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Consumer<GameProvider>(
          builder: (context, provider, child) {
            void flipAllCards() {
              int minLen =
                  min(_cardControllers.length, provider.getListOfCards.length);
              for (int i = 0; i < minLen; i++) {
                if (provider.getListOfCards[i].open) {
                  _cardControllers[i].toggleCard();
                  provider.getListOfCards[i].open = false;
                }
              }
            }

            return Column(
              children: [
                Text(provider.cardStack.isNotEmpty
                    ? provider.getTotalCheck[0]['text']
                    : ''),
                Expanded(
                  child: GridView.builder(
                    itemCount: provider.getListOfCards.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    padding: const EdgeInsets.all(16),
                    itemBuilder: (context, index) {
                      FlipCardController controller = FlipCardController();
                      _cardControllers.add(controller);

                      return GestureDetector(
                        child: CustomCard(
                          textCard: provider.getListOfCards[index].text,
                          index: index,
                          found: provider.getListOfCards[index].found,
                          controller: controller,
                          fillpAllCardsCallback: flipAllCards,
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
