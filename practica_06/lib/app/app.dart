import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff4a4a44),
        ),
        useMaterial3: true,
      ),
      title: 'Practica 6',
      debugShowCheckedModeBanner: false,
      home: const TabsPage(),
    );
  }
}

class TabsPage extends StatelessWidget {
  const TabsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Practica 06'),
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.accessibility_new)),
                Tab(icon: Icon(Icons.mail)),
                Tab(icon: Icon(Icons.map)),
                Tab(icon: Icon(Icons.contact_emergency)),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Tab(icon: Icon(Icons.accessibility_new)),
              Tab(icon: Icon(Icons.mail)),
              Tab(icon: Icon(Icons.map)),
              Tab(icon: Icon(Icons.contact_emergency)),
            ],
          )),
    );
  }
}
