import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class CrudPage extends StatefulWidget {
  const CrudPage({super.key});

  @override
  State<CrudPage> createState() => _CrudPageState();
}

class _CrudPageState extends State<CrudPage> {
  late Database database;
  late String _path;

  @override
  void initState() {
    _createDB();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practica 14 - SQLite'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _insertDB();
              },
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.green),
              child: const Text('INSERT'),
            ),
            ElevatedButton(
              onPressed: () {
                _removeDB();
              },
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.red),
              child: const Text('REMOVE'),
            ),
            ElevatedButton(
              onPressed: () {
                _updateDB();
              },
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.blue),
              child: const Text('UPDATE'),
            ),
            ElevatedButton(
              onPressed: () {
                _showDB();
              },
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.amber),
              child: const Text('SHOW'),
            ),
          ],
        ),
      ),
    );
  }

  void _createDB() async {
    final dbpath = await getDatabasesPath();

    _path = '{$dbpath}my_db.db';

    database = await openDatabase(_path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE Test(id INTEGER PRIMARY KEY, name TEXT, nickname TEXT)');
    });
  }

  void _insertDB() async {
    await database.transaction((txn) async {
      int reg1 = await txn.rawInsert(
          'INSERT INTO Test (name, nickname) VALUES ("Din Djarin", "The Mandalorian")');
      print('Insert $reg1');
      int reg2 = await txn.rawInsert(
          'INSERT INTO Test (name, nickname) VALUES (?, ?)',
          ['Grogu', 'The Child']);
      print('Insert $reg2');
    });
  }

  void _removeDB() async {
    int rem =
        await database.rawDelete('DELETE FROM Test WHERE name = ?', ['Grogu']);
    print('Remove: $rem');
  }

  void _updateDB() async {
    int upt = await database.rawUpdate(
        'UPDATE Test SET nickname =? where name = ?', ['Mando', 'Din Djarin']);
    print('Update: $upt');
  }

  void _showDB() async {
    List<Map> show = await database.rawQuery('SELECT * FROM Test');
    print(show);
  }
}
