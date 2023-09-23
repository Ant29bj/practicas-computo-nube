import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double size = 200;

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
          children: [
            Slider(
              value: size,
              min: 0,
              max: 400,
              onChanged: (value) {
                setState(() {
                  size = value;
                });
              },
            ),
            SizedBox(
              width: 400,
              height: 500,
              child: Center(
                child: Image.asset(
                  'assets/images/jslogo.png',
                  width: size,
                  height: size,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
