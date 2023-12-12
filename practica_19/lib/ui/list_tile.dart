import 'package:flutter/material.dart';
import 'package:practica19/src/details_page.dart';

// ignore: must_be_immutable
class MyListTile extends StatelessWidget {
  var titulo;
  var subtitulo;
  String imagenfin;

  MyListTile({this.titulo, this.subtitulo, required this.imagenfin});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.only(left: 15, right: 10, top: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [
            Color(0xFFFF422C),
            Color(0xFFFF9003),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: [0.25, 0.90],
        ),
      ),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(10),
      child: ListTile(
        tileColor: Color(0xFF272A3C),
        title: Text(titulo),
        subtitle: Text(subtitulo),
        trailing: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.network(imagenfin),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailsPage(
                        datosName: titulo,
                        datosGender: subtitulo,
                        datosImage: imagenfin,
                      )));
        },
      ),
    );
  }
}
