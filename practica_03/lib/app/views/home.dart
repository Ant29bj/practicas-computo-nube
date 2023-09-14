import 'package:flutter/material.dart';
import 'package:practica_03/app/views/data.dart';

const List<String> list = <String>['Hombre', 'Mujer'];

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _valor = list.first;
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 32),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Nombre',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    )),
              ),
            ),
            DropdownButton<String>(
              onChanged: (String? value) {
                setState(() {
                  if (value != null) {
                    _valor = value;
                  }
                });
              },
              value: _valor,
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            ElevatedButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return DataPage(
                        nombre: _controller.text,
                        genero: _valor,
                      );
                    },
                  ));
                }
              },
              child: const Text('Guardar'),
            )
          ],
        ),
      ),
    );
  }
}
