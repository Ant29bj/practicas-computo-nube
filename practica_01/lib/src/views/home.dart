import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

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
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        floatingActionButton: Wrap(
          direction: Axis.horizontal,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(10),
              child: FloatingActionButton(
                backgroundColor: Colors.greenAccent,
                onPressed: () {
                  increaseCounter();
                },
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: FloatingActionButton(
                backgroundColor: Colors.red,
                onPressed: () {
                  _decreaseCounter();
                },
                child: const Icon(
                  Icons.remove,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ));
  }

  void increaseCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decreaseCounter() {
    setState(() {
      _counter--;
    });
  }
}
