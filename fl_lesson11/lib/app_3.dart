import 'dart:math' as math;
import 'package:path/path.dart' as pathLib;
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';

class App3 extends StatefulWidget {
  const App3({super.key});

  @override
  State<App3> createState() => _App3State();
}

class _App3State extends State<App3> {
  late Database db;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    _init();
  }

  Future<String> get getDbPath => getDatabasesPath();

  Future<void> _init() async {
    var databasesPath = await getDbPath;
    String path = pathLib.join(databasesPath, 'demo.db');

    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
    });

    showMessage('DB opened');

    setState(() {
      isLoading = false;
    });
  }

  void showMessage(String value) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(value),
      duration: const Duration(seconds: 1),
    ));
  }

  Future<void> deleteDB() async {
    var databasesPath = await getDbPath;

    await deleteDatabase(pathLib.join(databasesPath, 'demo.db'));
  }

  @override
  void dispose() {
    db.close();

    super.dispose();
  }

  Future<void> insertIntoDB() async {
    await db.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT INTO Test(name, value, num) VALUES("some name", ${math.Random().nextInt(1000)}, ${math.Random().nextDouble()})');
      print('inserted1: $id1');
    });

    setState(() {});
  }

  Future<void> updateIntoDB() async {
    await db.rawUpdate('UPDATE Test SET name = ?, value = ? WHERE name = ?',
        ['updated name', '9876', 'some name']);

    setState(() {});
  }

  Future<List<Map>> getDataFromDB() async {
    return db.rawQuery('SELECT * FROM Test');
  }

  Future<void> clearDB() async {
    await db.rawDelete('DELETE FROM Test');

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: insertIntoDB, icon: const Icon(Icons.save)),
          IconButton(onPressed: updateIntoDB, icon: const Icon(Icons.update)),
          IconButton(onPressed: clearDB, icon: const Icon(Icons.delete)),
        ],
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : FutureBuilder(
              future: getDataFromDB(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const SizedBox();
                }

                if (snapshot.data!.isEmpty) {
                  return const Center(child: Text('No data'));
                }

                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final item = snapshot.data!.elementAt(index);

                    return Row(
                      children: [
                        Expanded(
                          child: Text(item['id'].toString()),
                        ),
                        Expanded(
                          child: Text(item['name'].toString()),
                        ),
                        Expanded(
                          child: Text(item['value'].toString()),
                        ),
                        Expanded(
                          child: Text(item['num'].toString()),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
    );
  }
}
