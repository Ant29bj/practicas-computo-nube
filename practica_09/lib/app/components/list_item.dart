import 'package:flutter/material.dart';

class CustomListItem extends StatelessWidget {
  CustomListItem({super.key, required this.tipo});
  String tipo;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        title: Text(tipo),
        leading: const CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(
              'https://imgs.search.brave.com/Wx6gbqqPRg4gdC6RadoYIqQK8lAzPrksdaqQUynGlhE/rs:fit:860:0:0/g:ce/aHR0cHM6Ly91cGxv/YWQud2lraW1lZGlh/Lm9yZy93aWtpcGVk/aWEvY29tbW9ucy8z/LzM5L1Bva2ViYWxs/LlBORw'),
        ),
        trailing: const Icon(Icons.arrow_right),
      ),
    );
  }
}
