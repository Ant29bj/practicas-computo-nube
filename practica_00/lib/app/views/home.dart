import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
            Image.asset('assets/images/js_logo.png'),
          ],
        ),
      ),
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton(
          onPressed: () => _showUserModal(context),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  void _showUserModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => const _NewUser(),
    );
  }
}

class _NewUser extends StatefulWidget {
  const _NewUser({super.key});

  @override
  State<_NewUser> createState() => _NewUserState();
}

class _NewUserState extends State<_NewUser> {
  final _usrController = TextEditingController();
  final _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 23),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Add a new user'),
          const SizedBox(
            height: 16,
          ),
          TextField(
            controller: _usrController,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                fillColor: Colors.white,
                hintText: 'Nombre de usuario'),
          ),
          const SizedBox(
            height: 16,
          ),
          TextField(
            controller: _phoneController,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                fillColor: Colors.white,
                hintText: 'Numero de telefono'),
          ),
          const SizedBox(
            height: 26,
          ),
          ElevatedButton(
            onPressed: () {
              if (_usrController.text.isNotEmpty &&
                  _phoneController.text.isNotEmpty) {
                var usr = _usrController.text;
                var phone = _phoneController.text;
                setState(() {
                  showDialog(
                    context: context,
                    builder: (_) => _FinalMessage(usr: usr, phone: phone),
                  );
                });
              }
            },
            child: const Text('Agregar'),
          )
        ],
      ),
    );
  }
}

class _FinalMessage extends StatelessWidget {
  const _FinalMessage({
    super.key,
    required this.usr,
    required this.phone,
  });

  final String usr;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('El usuario $usr tiene telefono $phone'),
            const SizedBox(
              height: 36,
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: const Text(
                'OK',
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
