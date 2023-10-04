import 'package:flutter/material.dart';
import 'package:practica_10/app/components/list_item.dart';
import 'package:practica_10/app/models/types.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practica 10'),
        centerTitle: true,
        backgroundColor: Colors.red[900],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: pokemonTypes.length,
          itemBuilder: (context, index) => CustomListItem(
            tipo: pokemonTypes[index],
          ),
        ),
      ),
    );
  }
}
