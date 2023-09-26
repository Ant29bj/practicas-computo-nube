import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practica 08'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Center(
        child: Text('Hello World!'),
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: const Column(
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: NetworkImage(
                        'https://steamuserimages-a.akamaihd.net/ugc/2054258266977852042/A5EF673053D26ADD82C704E3769FBE5F8CE8CAC3/?imw=637&imh=358&ima=fit&impolicy=Letterbox&imcolor=%23000000&letterbox=true'),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Sekai',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text('Full Stack Dev'),
                ],
              ),
            ),
            const ListTile(
              leading: Icon(Icons.person),
              title: Text('Perfil'),
            ),
            const ListTile(
              leading: Icon(Icons.mail),
              title: Text('Mensajes'),
            ),
            const ListTile(
              leading: Icon(Icons.dashboard),
              title: Text('Dashboard'),
            ),
            const ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configuracion'),
            )
          ],
        ),
      ),
    );
  }
}
