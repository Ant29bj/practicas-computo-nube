import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:practica17/data/movies.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  List<Map<String, dynamic>> pelis = [...movies];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practica 17 - Dismissed'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: ListView.builder(
          itemCount: pelis.length,
          itemBuilder: (BuildContext context, int index) {
            final item = pelis[index];
            return Slidable(
              actionPane: const SlidableDrawerActionPane(),
              actions: [
                IconSlideAction(
                  caption: 'Agregar',
                  color: Colors.green,
                  icon: Icons.library_add,
                  onTap: () => onDismissed(index, 'Agregar'),
                )
              ],
              secondaryActions: [
                IconSlideAction(
                  caption: 'Eliminar',
                  color: Colors.red,
                  icon: Icons.cancel_outlined,
                  onTap: () => onDismissed(index, 'Eliminar'),
                )
              ],
              child: ListTile(
                  title: Text(item['title_name']),
                  subtitle: Text(item['Genres'])),
            );
          }),
    );
  }

  onDismissed(int index, String accion) {
    setState(() {
      final snackBar = SnackBar(content: Text('Accion: $accion'));
      pelis.removeAt(index);
      switch (accion) {
        case 'Agregar':
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          break;
        case 'Eliminar':
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          break;
      }
    });
  }
}
