import 'package:flutter/material.dart';
//import 'package:image_downloader/image_downloader.dart';
import 'package:practica19/src/pdf_preview.dart';
import 'package:practica19/ui/details_container.dart';
import 'package:practica19/ui/head_container.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';

// ignore: must_be_immutable
class DetailsPage extends StatelessWidget {
  var datosName;
  var datosGender;
  String? datosImage;
  String? _path;

  DetailsPage({
    this.datosName,
    this.datosGender,
    this.datosImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(datosName + ' Details'),
        backgroundColor: const Color(0xFFFF422C),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        color: const Color(0xFF272A3C),
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            MyHeadContainer(imagerec: datosImage),
            MyDetailContainer(nom: datosName, sexo: datosGender),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFFF422C),
        child: const Icon(Icons.print_outlined),
        onPressed: () {
          _downloadedImage();

          Future.delayed(
              const Duration(milliseconds: 3000),
              () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PdfPage(
                            nombre: datosName,
                            genero: datosGender,
                            imagenurl: _path,
                          ))));
        },
      ),
    );
  }

  _downloadedImage() async {
    try {
      final file = await FileDownloader.downloadFile(url: datosImage!);
      _path = file?.path;
      print('FILE: ${file?.path}');
    } catch (error) {
      print(error);
    }
    // print('datosImage: $datosImage');

    // String? imageId = await ImageDownloader.downloadImage(datosImage!);
    // print('imageId: $imageId');

    // _path = await ImageDownloader.findPath(imageId!);
    // print('Path: $_path');
  }
}
