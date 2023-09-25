import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

int currentIndex = 1;

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    final tabs = [
      const Center(
        child: Text(
          'Mapa',
          style: TextStyle(
            fontSize: 50,
          ),
        ),
      ),
      const Center(
        child: Text(
          'Email',
          style: TextStyle(
            fontSize: 50,
          ),
        ),
      ),
      const Center(
        child: Text(
          'Alarma',
          style: TextStyle(
            fontSize: 50,
          ),
        ),
      )
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Practica 7'),
        ),
        body: tabs[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Mapa',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.email),
              label: 'Email',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.lock_clock),
              label: 'Alarma',
            ),
          ],
          onTap: (index) => setState(() {
            currentIndex = index;
            print(currentIndex);
          }),
        ),
      ),
    );
  }
}
