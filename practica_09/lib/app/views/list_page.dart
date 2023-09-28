import 'package:flutter/material.dart';
import 'package:practica_09/app/components/list_item.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practica 09'),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          children: [
            CustomListItem(tipo: 'Nomral'),
            CustomListItem(tipo: 'Fighting'),
            CustomListItem(tipo: 'Flying'),
            CustomListItem(tipo: 'Poison'),
            CustomListItem(tipo: 'Ground'),
            CustomListItem(tipo: 'Rock'),
            CustomListItem(tipo: 'Bug'),
            CustomListItem(tipo: 'Ghost'),
            CustomListItem(tipo: 'Steel'),
            CustomListItem(tipo: 'Fire'),
            CustomListItem(tipo: 'Water'),
            CustomListItem(tipo: 'Grass'),
            CustomListItem(tipo: 'Electric'),
            CustomListItem(tipo: 'Psychic'),
            CustomListItem(tipo: 'Ice'),
            CustomListItem(tipo: 'Dragon'),
            CustomListItem(tipo: 'Dark'),
            CustomListItem(tipo: 'Fairy'),
            CustomListItem(tipo: 'Unknown'),
            CustomListItem(tipo: 'Shadow'),
          ],
        ),
      ),
    );
  }
}
