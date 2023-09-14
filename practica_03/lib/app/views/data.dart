import 'package:flutter/material.dart';

class DataPage extends StatelessWidget {
  DataPage({super.key, required this.nombre, required this.genero});
  String nombre;
  String genero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Datos'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Nombre: $nombre',
              style: const TextStyle(fontSize: 32),
            ),
            Text(
              'Sexo: $genero',
              style: const TextStyle(fontSize: 32),
            ),
          ],
        ),
      ),
    );
  }
}
